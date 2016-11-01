<!---


Description:
--->
<!--- varaible declaration --->

<!---<cfparam name="variables.contact_name" default="">---->
<!---<cfparam   name="url.lang_pref  default="en">--->
<cfparam   name="variables.db_message" default="">
<!--- control block --->

<cfif isDefined("form.submit_new_entry")>
	<cfset getvaluesFromForm()>
	<cfset  variables.validation= structNew()><!--- for storing validation result --->
	<cfset variables.validation=validateFormData()>
	<cfif variables.validation.result > <!--- validation passed --->
	
	<cfabort>
		<cfset variables.db_message=insertIntoDatabase()>
		<cfif NOT len(variables.db_message)>
			<cfset variables.validation.message="Contact saved">
			<!--- navigate to the list contacts page --->
			<cflocation url="view_contacs.cfm?msg=#variables.validation.message#">
		</cfif>
	</cfif>
</cfif>

<!--- Functions block--->

<cffunction name="getvaluesFromForm" returntype="void" hint="validate user inputs">
	<cfif isDefined("form.contact_name") and len(form.contact_name)>
		<cfset variables.contact_name= form.contact_name>
	<cfelse>	
		<cfset variables.contact_name="">
	</cfif>
	<cfif isDefined("form.contact_email") and len(form.contact_email)>
		<cfset variables.contact_email= form.contact_email>
	<cfelse>	
		<cfset variables.contact_email="">
	</cfif>

</cffunction>

<cffunction name="validateFormData" returntype="struct" hint="validate user inputs">
<!---<cfargument name="contact_name"  required="true" default="">--->
	<cfset local.validation= structnew()>
	<cfset local.validation.message="">
	<cfset local.validation.result= false><!---keep default failed--->
	<cfif NOT isValid("regex", variables.contact_name)>
		<cfset local.validation.message="Please enter a valid Name">
	</cfif>
	<cfif NOT isValid("email", variables.contact_email)>
		<cfset local.validation.message="Please enter a valid Name">
	</cfif>	
	<cfif len(local.validation.message) lt 1>
		<cfset local.validation.result= true>
		<cfreturn local.validation>
	</cfif>
	<cfset local.validation.message= local.message&"</br> The contact is not saved" >
	<cfreturn local.validation>
</cffunction>

<!---- save new record into database --->



<cffunction name="insertIntoDatabase" returntype="struct" hint="validate user inputs">
<!---<cfargument name="contact_name"  required="true" default="">--->
	<cfset local.validation= structnew()>
	<cfset local.validation.message="">
	<cfset local.validation.result= false><!---keep default failed--->
	<cfquery name="qinsertContact" datasource="excel_learn">
		INSERT INTO tbl_contacts
			(contact_name,contact_email)
	
	</cfquery>
</cffunction>






