



class NetListBean {

	NetListBean();

	factory NetListBean.fromJson(Map<String, dynamic> json){
		final NetListBean netListBean = NetListBean();
		return netListBean;
	}



	late String desc;
	late double id;
	late String imagePath;
	late double isVisible;
	late double order;
	late String title;
	late double type;
	late String url;
}
