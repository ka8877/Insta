package com.kosmo.alone.vo;

public class HotspotsVO {
   
   private int hotPk;
   private int hotCateSeq;
   private String hotName;
   private String hotDetail;
   private String hotAddr;
   private String hotOpen;
   private String hotTel;
   private double hotLat;
   private double hotLng;
   private String hotRegdate;
   private int hotIson;
   private String hotCity;
   private String hotPlaceId;
   
   //카테고리 HotCategories
//   private int hotCateSeq;
   private String hotCateName;
   
   //스크랩 HotScrapsVO
//   private int hotPk;
//   private int hotCateSeq;
//   private int monPk;
   private int hotScrPk;
   private String hotScrRegdate;

   //사진 HotPicsVO
//   private int hotPk;
//   private int hotCateSeq;
   private int hotPicPk;
   private String hotPicUrl;
   private String hotPicRegdate;
   private int hotPicIsmain;
   
   //회원 Monsters
   private int monPk;
   private String monName;
   private String monEmail;
   private String monBirthday;
   private String monSex;
   private int monTel;
   private int monActivate;
   private int monCharged;
   private String monRegdate;
   private String monProfile;
   private int monLoveball;
   private String monIntro;
   private String monToken;
   private String monId;
   
   //리뷰
   private int hotRevPk;
   private String hotRevCon;
   private int hotRevServiceRating;
   private String hotRevRegdate;
   private int hotCostRating;
   
   //페이징
   private int sseq;
   private int eseq;
   private int currentPage;
   private String html;
   
   //별점 
   private double avgRating;
   private int totalReviewer;
   private int costCnt5;
   private int costCnt4;
   private int costCnt3;
   private int costCnt2;
   private int costCnt1;
   
   
   //기타
   private int rnum;
   
   
   public int getCurrentPage() {
      return currentPage;
   }
   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }
   public int getSseq() {
      return sseq;
   }
   public void setSseq(int sseq) {
      this.sseq = sseq;
   }
   public int getEseq() {
      return eseq;
   }
   public void setEseq(int eseq) {
      this.eseq = eseq;
   }
   
   
   
   public String getHotPlaceId() {
      return hotPlaceId;
   }
   public void setHotPlaceId(String hotPlaceId) {
      this.hotPlaceId = hotPlaceId;
   }
   public int getHotPk() {
      return hotPk;
   }
   public void setHotPk(int hotPk) {
      this.hotPk = hotPk;
   }
   public int getHotCateSeq() {
      return hotCateSeq;
   }
   public void setHotCateSeq(int hotCateSeq) {
      this.hotCateSeq = hotCateSeq;
   }
   public String getHotName() {
      return hotName;
   }
   public void setHotName(String hotName) {
      this.hotName = hotName;
   }
   public String getHotDetail() {
      return hotDetail;
   }
   public void setHotDetail(String hotDetail) {
      this.hotDetail = hotDetail;
   }
   public String getHotAddr() {
      return hotAddr;
   }
   public void setHotAddr(String hotAddr) {
      this.hotAddr = hotAddr;
   }
   public String getHotOpen() {
      return hotOpen;
   }
   public void setHotOpen(String hotOpen) {
      this.hotOpen = hotOpen;
   }
   public String getHotTel() {
      return hotTel;
   }
   public void setHotTel(String hotTel) {
      this.hotTel = hotTel;
   }
   public double getHotLat() {
      return hotLat;
   }
   public void setHotLat(double hotLat) {
      this.hotLat = hotLat;
   }
   public double getHotLng() {
      return hotLng;
   }
   public void setHotLng(double hotLng) {
      this.hotLng = hotLng;
   }
   public String getHotRegdate() {
      return hotRegdate;
   }
   public void setHotRegdate(String hotRegdate) {
      this.hotRegdate = hotRegdate;
   }
   public int getHotIson() {
      return hotIson;
   }
   public void setHotIson(int hotIson) {
      this.hotIson = hotIson;
   }
   public String getHotCity() {
      return hotCity;
   }
   public void setHotCity(String hotCity) {
      this.hotCity = hotCity;
   }
   public String getHotCateName() {
      return hotCateName;
   }
   public void setHotCateName(String hotCateName) {
      this.hotCateName = hotCateName;
   }
   public int getMonPk() {
      return monPk;
   }
   public void setMonPk(int monPk) {
      this.monPk = monPk;
   }
   public int getHotScrPk() {
      return hotScrPk;
   }
   public void setHotScrPk(int hotScrPk) {
      this.hotScrPk = hotScrPk;
   }
   public String getHotScrRegdate() {
      return hotScrRegdate;
   }
   public void setHotScrRegdate(String hotScrRegdate) {
      this.hotScrRegdate = hotScrRegdate;
   }
   public int getHotPicPk() {
      return hotPicPk;
   }
   public void setHotPicPk(int hotPicPk) {
      this.hotPicPk = hotPicPk;
   }
   public String getHotPicUrl() {
      return hotPicUrl;
   }
   public void setHotPicUrl(String hotPicUrl) {
      this.hotPicUrl = hotPicUrl;
   }
   public String getHotPicRegdate() {
      return hotPicRegdate;
   }
   public void setHotPicRegdate(String hotPicRegdate) {
      this.hotPicRegdate = hotPicRegdate;
   }
   public int getHotPicIsmain() {
      return hotPicIsmain;
   }
   public void setHotPicIsmain(int hotPicIsmain) {
      this.hotPicIsmain = hotPicIsmain;
   }
   public String getMonName() {
      return monName;
   }
   public void setMonName(String monName) {
      this.monName = monName;
   }
   public String getMonEmail() {
      return monEmail;
   }
   public void setMonEmail(String monEmail) {
      this.monEmail = monEmail;
   }
   public String getMonBirthday() {
      return monBirthday;
   }
   public void setMonBirthday(String monBirthday) {
      this.monBirthday = monBirthday;
   }
   public String getMonSex() {
      return monSex;
   }
   public void setMonSex(String monSex) {
      this.monSex = monSex;
   }
   public int getMonTel() {
      return monTel;
   }
   public void setMonTel(int monTel) {
      this.monTel = monTel;
   }
   public int getMonActivate() {
      return monActivate;
   }
   public void setMonActivate(int monActivate) {
      this.monActivate = monActivate;
   }
   public int getMonCharged() {
      return monCharged;
   }
   public void setMonCharged(int monCharged) {
      this.monCharged = monCharged;
   }
   public String getMonRegdate() {
      return monRegdate;
   }
   public void setMonRegdate(String monRegdate) {
      this.monRegdate = monRegdate;
   }
   public String getMonProfile() {
      return monProfile;
   }
   public void setMonProfile(String monProfile) {
      this.monProfile = monProfile;
   }
   public int getMonLoveball() {
      return monLoveball;
   }
   public void setMonLoveball(int monLoveball) {
      this.monLoveball = monLoveball;
   }
   public String getMonIntro() {
      return monIntro;
   }
   public void setMonIntro(String monIntro) {
      this.monIntro = monIntro;
   }
   public String getMonToken() {
      return monToken;
   }
   public void setMonToken(String monToken) {
      this.monToken = monToken;
   }
   public String getMonId() {
      return monId;
   }
   public void setMonId(String monId) {
      this.monId = monId;
   }
   public double getAvgRating() {
      return avgRating;
   }
   public void setAvgRating(double avgRating) {
      this.avgRating = avgRating;
   }
   public int getTotalReviewer() {
      return totalReviewer;
   }
   public void setTotalReviewer(int totalReviewer) {
      this.totalReviewer = totalReviewer;
   }
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public String getHtml() {
      return html;
   }
   public void setHtml(String html) {
      this.html = html;
   }
   public int getHotRevPk() {
      return hotRevPk;
   }
   public void setHotRevPk(int hotRevPk) {
      this.hotRevPk = hotRevPk;
   }
   public String getHotRevCon() {
      return hotRevCon;
   }
   public void setHotRevCon(String hotRevCon) {
      this.hotRevCon = hotRevCon;
   }
   public int getHotRevServiceRating() {
      return hotRevServiceRating;
   }
   public void setHotRevServiceRating(int hotRevServiceRating) {
      this.hotRevServiceRating = hotRevServiceRating;
   }
   public String getHotRevRegdate() {
      return hotRevRegdate;
   }
   public void setHotRevRegdate(String hotRevRegdate) {
      this.hotRevRegdate = hotRevRegdate;
   }
   public int getHotCostRating() {
      return hotCostRating;
   }
   public void setHotCostRating(int hotCostRating) {
      this.hotCostRating = hotCostRating;
   }
   public int getCostCnt5() {
      return costCnt5;
   }
   public void setCostCnt5(int costCnt5) {
      this.costCnt5 = costCnt5;
   }
   public int getCostCnt4() {
      return costCnt4;
   }
   public void setCostCnt4(int costCnt4) {
      this.costCnt4 = costCnt4;
   }
   public int getCostCnt3() {
      return costCnt3;
   }
   public void setCostCnt3(int costCnt3) {
      this.costCnt3 = costCnt3;
   }
   public int getCostCnt2() {
      return costCnt2;
   }
   public void setCostCnt2(int costCnt2) {
      this.costCnt2 = costCnt2;
   }
   public int getCostCnt1() {
      return costCnt1;
   }
   public void setCostCnt1(int costCnt1) {
      this.costCnt1 = costCnt1;
   }
   
}