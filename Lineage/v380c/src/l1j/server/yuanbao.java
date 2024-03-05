步驟１
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
l1j\server\server\datatables\ShopTable.java

找尋：

private final Map<Integer, L1Shop> _allShops = new HashMap<Integer, L1Shop>();

底下加入：

private final Map<Integer, Integer> _allItemSells = new HashMap<Integer, Integer>();

找尋：

private L1Shop loadShop(int npcId, ResultSet rs) throws SQLException {

整段修改為：

private L1Shop loadShop(int npcId, ResultSet rs) throws SQLException {
List<L1ShopItem> sellingList = new ArrayList<L1ShopItem>();
List<L1ShopItem> purchasingList = new ArrayList<L1ShopItem>();
while (rs.next()) {
int itemId = rs.getInt("item_id");
int sellingPrice = rs.getInt("selling_price");
int purchasingPrice = rs.getInt("purchasing_price");
int packCount = rs.getInt("pack_count");
packCount = packCount == 0 ? 1 : packCount;
int yuanbao = rs.getInt("yuanbao");//add liumy

switch(npcId){
case 70068:case 70020:
case 70024:case 70032:
case 80075:
continue;
default:
break;
}

if(0 <= sellingPrice){
if(_allItemSells.get(itemId)==null){
_allItemSells.put(itemId, sellingPrice/2);
}else if(_allItemSells.get(itemId)<sellingPrice/2){
_allItemSells.put(itemId, sellingPrice/2);
}
}else{ //-1
if(0 <= purchasingPrice){
if(_allItemSells.get(itemId)==null){
_allItemSells.put(itemId, purchasingPrice);
}else if(_allItemSells.get(itemId)<purchasingPrice){
_allItemSells.put(itemId, purchasingPrice);
}
}
}

if (0 <= sellingPrice && 0 >= yuanbao ) {
L1ShopItem item = new L1ShopItem(itemId, sellingPrice,
packCount);
sellingList.add(item);
}
if (0 <= purchasingPrice && 0 >= yuanbao ) {
L1ShopItem item = new L1ShopItem(itemId, purchasingPrice,
packCount);
purchasingList.add(item);
}
if (0 < yuanbao ) { //add liumy
L1ShopItem item = new L1ShopItem(itemId, yuanbao,
packCount);
sellingList.add(item);
}//add liumy end
}
return new L1Shop(npcId, sellingList, purchasingList);
}




　　　步驟２
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
l1j\server\server\model\shop\L1Shop.java

找尋：

import l1j.server.server.serverpackets.S_ServerMessage;

下方加入：

import l1j.server.server.serverpackets.S_SystemMessage;


找尋：

private boolean ensureSell(L1PcInstance pc, L1ShopBuyOrderList orderList) {

修改為：

private boolean ensureSell(L1PcInstance pc, L1ShopBuyOrderList orderList) {
        int price = orderList.getTotalPriceTaxIncluded();
//         オーバーフローチェック
       if (!IntRange.includes(price, 0, 2000000000)) {
//         總販賣価格は%dアデナを超過できません。
       pc.sendPackets(new S_ServerMessage(904, "2000000000"));
        return false;
        }
//         購入できるかチェック
//        add liumy
        int bb;
        if (_npcId >= 自己設定元寶 && _npcId <= 995000) { //元寶商城專用NPC的ID
        bb =61019; //元寶物品編號item_id
        }else{
        bb =L1ItemId.ADENA;
        }//add liumy
        if (!pc.getInventory().checkItem(bb, price)) {
//        l1j.eric.gui.J_Main.getInstance().addConsolPost(\"\"+price);
//         \\f1アデナが不足しています。
       if (L1ItemId.ADENA == bb){ //add liumy
        pc.sendPackets(new S_ServerMessage(189));
        }else{
        pc.sendPackets(new S_SystemMessage("元寶不足"));
        }
        return false;
        }

　　　　　　　　　　　　※　到此地方以上　※
// 重量チェック
       int currentWeight = pc.getInventory().getWeight() * 1000;

找尋：

private void sellItems(L1PcInventory inv, L1ShopBuyOrderList orderList) {

修改為：

private void sellItems(L1PcInventory inv, L1ShopBuyOrderList orderList) {
        //add liumy
        int bb;
        if (_npcId >= 990000 && _npcId <= 995000) {
        bb =61019; //元寶物品編號item_id
        }else{
        bb =L1ItemId.ADENA;
        }
        if (!inv.consumeItem(bb, orderList
        .getTotalPriceTaxIncluded())) {
        throw new IllegalStateException("購入に必要なアデナを消費できませんでした。");
        }

　　　　　　　※　到此地方以上　※
for (L1ShopBuyOrder order : orderList.getList()) {


　　　步驟３＿DB修改
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
db_shop

點選左上角【檔案】→【設計資料表】→ 【新增欄位】
名稱地方輸入：yuanbao ※大小寫需與核心內一模一樣

類型為: int 長度：10 十進位：0 允許空值：打勾取消   下方預設值：0

上方【儲存】到此修改已完成。

yuanbao欄位為元寶價格設定。

NPC編號：990000　至　995000皆可使用。

元寶編號：61019