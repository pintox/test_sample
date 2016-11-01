<!---
File Name: Application.cfc
Author :YourName
Description: Page to add contact Details 
Created Date:
--->
<cfinclude template="act_add_contact.cfm">
<html>
	<head>
		<style>
			body{
			width:800px;		
			}
		</style>
	</head>
	<body> 
		<form action="add_contact.cfm" method="post" onsubmit="validateForm()">
		
			<label for="contact_name" id="contact_name"> Contact Name:</label>
			<input type="text" name="contact_name" id="contact_name">
			
			<label for="contact_email" id="contact_email"> Contact Email:</label>
			<input type="text" name="contact_email" id="contact_email">


			<input type="submit" name="submit_new_entry" id="submit_new_entry" value="Save">
		</form>
		<!-- validation java script begins -->
		<script>
			function validateForm(){
			
			
			return true;
			}
		</script>
		<!-- end -->
	</body>
</html>
