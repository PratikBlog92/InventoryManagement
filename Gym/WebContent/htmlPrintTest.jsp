<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Hello world</title>
</head>

<body>
    <h1>Hello world</h1>
    <p id="ignorePDF">don't print this to pdf</p>
    <div id="pdf">
        <div class="content-body">
            <h2>Introduction</h2>
            pratik dandare
          <!--   <p class="text-normal">The order in which commands to download external Cascading Style Sheets (CSS) files and JavaScript files are placed in an HTML page can affect how quickly the page is rendered and even whether the page is rendered at all.</p>
            <p class="text-normal">When a CSS file is loaded before a JavaScript file, the page can begin rendering and the file downloads can happen in parallel which speeds up the rendering time.</p>
            <p class="text-normal">If the order is reversed, the files are downloaded sequentially and the JavaScript file must finish loading completely before any other file can be downloaded. This means that the page cannot begin rendering until the JavaScript download is complete and the CSS file can begin loading.</p>
            <p class="text-normal">This Best Practice Deep Dive looks at the issues involved with the order in which files are downloaded, tells you how AT&amp;T ARO can help identify when certain files are loaded in an inefficient order, and provides recommendations for downloading style sheets and scripts.</p>
            <h2>Background</h2>
            <p class="text-normal">As a developer building HTML 5 style apps or webpages, you can control the order that files are requested by your mobile app. It is important to consider the order you request the files in, because some ways are faster than others.</p>
            <h2>The Issue</h2>
            <p class="text-normal">Script files (such as JavaScript) are loaded sequentially unless asynchronous downloading is specified (for more information, see Asynchronous Load of JavaScript in HTML). Sequential (synchronous) download means that the entire script file must be downloaded before any other files can be downloaded and before any other instructions on the page, such as inline code or HTML, can be executed.</p>
            <p class="text-normal">Another issue that can occur when a JavaScript file is loaded before a CSS file, is that any JavaScript code which relies on properties set in that CSS file can't be executed until both files have finished loading.</p>
            <h2>Best Practice Recommendation</h2>
            <p class="text-normal">The Best Practice Recommendation is to download CSS before script files, and to move SCRIPT tags to the bottom of the page whenever possible.</p>
            <p class="text-normal">The AT&amp;T Application Resource Optimizer (ARO) can help you identify this potential file order problem. AT&amp;T ARO tests the HTML documents in your app and if a JavaScript file is loaded before a CSS file in the HEAD of an HTML document, the test fails and the name of the file is listed in the rest results.</p>
 -->       
 		<input type="text"value="Pratik" class="text-normal">
 		<input type="text"value="Dandare" class="text-normal">
 		<input type="submit" value="Submit"> 
 		 
  </div>
    </div>
    <input type="button" value="Print Div Contents" id="btnPrint" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <!-- Below script will print div with id pdf to a pdf file using jspdf -->
    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var printDoc = new jsPDF();
            printDoc.fromHTML($('#pdf').get(0), 10, 10, {
                'width': 180
            });
            printDoc.autoPrint();
            printDoc.output("dataurlnewwindow");
            // this opens a new popup,  after this the PDF opens the print window view but there are browser inconsistencies with how this is handled
        });
    </script>
</body>

</html>