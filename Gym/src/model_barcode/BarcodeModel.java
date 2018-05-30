package model_barcode;

public class BarcodeModel {
	
	int id,quantity;
	String product_name;
	float gst;
	float cost;
	String brand,barcode;
	
	public BarcodeModel(int id, int quantity, String product_name, float gst, float cost, String brand,
			String barcode) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.product_name = product_name;
		this.gst = gst;
		this.cost = cost;
		this.brand = brand;
		this.barcode = barcode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public float getGst() {
		return gst;
	}
	public void setGst(float gst) {
		this.gst = gst;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	@Override
	public String toString() {
		return "BarcodeModel [id=" + id + ", quantity=" + quantity + ", product_name=" + product_name + ", gst=" + gst
				+ ", cost=" + cost + ", brand=" + brand + ", barcode=" + barcode + "]";
	}
	
	
	
}
