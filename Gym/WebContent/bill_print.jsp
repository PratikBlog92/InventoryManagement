<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPage"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="java.net.URL"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
			response.setContentType("application/pdf");
			Rectangle pageSize = new Rectangle(780, 525);
			Document document = new Document(pageSize);
			PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
			//PdfWriter.getInstance(document, response.getOutputStream());
			document.open();
			//document.addHeader("jinu","jawad");
			float[] colsWidth1 = { 1f, 1f, 1f, 1f, 1f }; // Code 1
			//Image image = Image.getInstance(path+"employee/payslip/view/fly-hind.jpg");
			PdfPTable table = new PdfPTable(colsWidth1);
			table.getDefaultCell().setBorder(0);
			table.setWidthPercentage(100); // Code 2
			table.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
			table.addCell("");
			table.addCell("");
			table.addCell("Gold Gym");
			table.addCell("");
			table.addCell("");
			table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");table.addCell("");
			table.addCell("");
			document.add(table);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
		
		/*  float[] colsWidth_main = { 1f, 1f, 1f }; // Code 1
			table = new PdfPTable(colsWidth_main);
			table.getDefaultCell().setBorder(0);
			table.setWidthPercentage(100); // Code 2
			table.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
			table.addCell("");
			table.addCell(Image.getInstance("C:\\Users\\Genius\\Desktop\\python\\img.png"));
			table.addCell("");
			document.add(table);  
		*/	
 			float[] colsWidth = { 1f, 1f, 1f, 1f }; // Code 1
		/* 	table = new PdfPTable(colsWidth);
			table.getDefaultCell().setBorder(0);
			table.setWidthPercentage(100); // Code 2
			table.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
			table.addCell("Employee ID");
			table.addCell("00000");
			table.addCell("Name");
			table.addCell("00000");
			table.addCell("Department");
			table.addCell("00000");
			table.addCell("Designation");
			table.addCell("00000");
			table.addCell("Date Of Joining");
			table.addCell("00000");
			table.addCell("PF Account No");
			table.addCell("00000");
			table.addCell("Days Worked");
			table.addCell("00000");
			table.addCell("ESI Account Number");
			table.addCell("00000");
			table.addCell("Casual Leave");
			table.addCell("00000");
			table.addCell("Adhar Number");
			table.addCell("00000");
			table.addCell("PAN Number");
			table.addCell("00000");
			table.addCell(" ");
			table.addCell(" ");
			table.addCell(" ");
			table.addCell(" ");
			document.add(table);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
		 */
		 
		 	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
			PdfPTable table1 = new PdfPTable(colsWidth);
			table1.setWidthPercentage(100); // Code 2
			table1.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
			Phrase ProductName = new Phrase("Product Name", boldFont);
			Phrase Quantity = new Phrase("Quantity", boldFont);
			Phrase Price = new Phrase("Price", boldFont);
			Phrase GST = new Phrase("GST", boldFont);
			Phrase TotalAmount = new Phrase("Total Amount", boldFont);
			Phrase FinalAmount = new Phrase("Final Amount", boldFont);
			Phrase Discount = new Phrase("Discount", boldFont);
			Phrase recivedAmount = new Phrase("Recived Amount", boldFont);
			Phrase BalenceAmount = new Phrase("Balence Amount", boldFont);
			table1.addCell(ProductName);
			table1.addCell(Quantity);
			table1.addCell(Price);
			table1.addCell(GST);
			table1.addCell(TotalAmount);
			table1.addCell("Basic Pay");
			table1.addCell("00000");
			table1.addCell("PF");
			table1.addCell("00000");
			table1.addCell("HRA");
			table1.addCell("00000");
			table1.addCell("ESI");
			table1.addCell("00000");
			table1.addCell("Festival Allowance");
			table1.addCell("00000");
			table1.addCell("Professional Taxes");
			table1.addCell("00000");
			table1.addCell("Others");
			table1.addCell("00000");
			table1.addCell("Others");
			table1.addCell("00000");
			table1.addCell(FinalAmount);
			table1.addCell("00000");
			table1.addCell(Discount);
			table1.addCell("00000");
			document.add(table1);
			PdfPTable table2 = new PdfPTable(colsWidth);
			table2.setWidthPercentage(100); // Code 2
			table2.getDefaultCell().setBorder(0);
			table2.setHorizontalAlignment(Element.ALIGN_MIDDLE);//Code 3
			Phrase employers_signature = new Phrase("Employer's Signature", boldFont);
			Phrase employees_signature = new Phrase("Employee's Signature", boldFont);
			document.add(Chunk.NEWLINE);
			table2.addCell(" ");
			table2.addCell(" ");
			table2.addCell(" ");
			table2.addCell(" ");
			table2.addCell(employers_signature);
			table2.addCell("");
			table2.addCell(employees_signature);
			table2.addCell("");
			document.add(Chunk.NEWLINE);
			document.add(table2);
			PdfContentByte cb = writer.getDirectContent();
			cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA, BaseFont.WINANSI, false), 24);
			cb.setLineWidth(3);
			cb.moveTo(10, 515);
			cb.lineTo(770, 515);
			cb.moveTo(10, 10);
			cb.lineTo(770, 10);
			cb.moveTo(770, 515);
			cb.lineTo(770, 10);
			cb.moveTo(10, 515);
			cb.lineTo(10, 10);
			cb.stroke();
			document.close();
		%>
	</center>
</body>
</html>