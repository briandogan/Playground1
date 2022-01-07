public class GoRestGetUserResponse {
	public cls_meta meta;
	public List<cls_data> data;
	public class cls_meta {
		public cls_pagination pagination;
	}
	public class cls_pagination {
		public Integer total;	//2148
		public Integer pages;	//108
		public Integer page;	//1
		public Integer limit_c;	//20
		public cls_links links;
	}
	public class cls_links {
		public cls_previous previous;
		public String current;	//https://gorest.co.in/public/v1/users?page=1
		public String next;	//https://gorest.co.in/public/v1/users?page=2
	}
	public class cls_previous {
	}
	public class cls_data {
		public Integer id;	//3539
		public String name;	//Faustino
		public String email;	//Lilian_Larkin78@example.com
		public String gender;	//female
		public String status;	//active
        public String field;
        public String message;
	}
	public static GoRestGetUserResponse parse(String json){
		return (GoRestGetUserResponse) System.JSON.deserialize(json, GoRestGetUserResponse.class);
	}
}