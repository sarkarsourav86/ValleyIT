<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yourstay.aspx.cs" Inherits="FinalHotelProject.Yourstay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Smart Forms </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css"  href="css/smart-forms.css">
    <link rel="stylesheet" type="text/css"  href="css/font-awesome.min.css">
    <script src="js/additional-methods.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!--[if lte IE 9]>   
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
    <![endif]-->    
    
    <!--[if lte IE 8]>
        <link type="text/css" rel="stylesheet" href="css/smart-forms-ie8.css">
    <![endif]-->
</head>
<body class="woodbg">

	<div class="smart-wrap">
    	<div class="smart-forms smart-container wrap-2">
        
        	<div class="form-header header-primary">
            	<h4><i class="fa fa-pencil-square"></i>My Room Feedback </h4>
            </div><!-- end .form-header section -->
            
            <form id="form1" runat="server">
            	<div class="form-body">
                     
                    <div class="spacer-b30">
                        <div class="tagline"><span>How's Your Stay So Far</span></div><!-- .tagline -->
                    </div>                   
                   
                    
                    
                    
                    
                    
                    <div class="frm-row">
                    
                        <div class="section colm colm12">
                        
                            <div class="option-group field">
                            	<div class="smart-option-group smart-option-list group-vertical"> 
                                       <asp:RadioButtonList  ID="RadioStay" runat="server">
                                            <asp:ListItem Value="1">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                      Works Great / Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="2">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Not Satisfied with it
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="3">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Something is Broken
                                                </span>
                                            </span></asp:ListItem>
                                            <asp:ListItem Value="4">
                                                <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                     Needs Immediate Attention
                                                </span>
                                            </span></asp:ListItem>   
                                            
                                             
                                        </asp:RadioButtonList>
                                    
                                    
                                                                
                                    
                                    
                                    
                                        <label for="TxtComment" class="field-label">Report A Problem</label>
                                        <label class="field prepend-icon">
                                            
                                            <asp:TextBox CssClass="gui-textarea" TextMode="MultiLine" ID="TxtComment" runat="server"></asp:TextBox>
                                            <span class="field-icon"><i class="fa fa-comments"></i></span>
                                            <span class="input-hint"> <strong>Hint:</strong> Please leave us a comment to help serve you better.</span>
                                        </label>
                                    
                                
                                </div><!--  smart-option-group -->   
                            </div><!-- end .option-group section --> 
                                                
                        </div><!-- end .colm section -->
                        
                                                        
                        <!-- end .colm section -->
                        
                    </div> <!-- end .frm-row section -->                    
                    
                    
                    
                                                                                                   
                    
                </div><!-- end .form-body section -->
                <div class="form-footer">
                	
                    <asp:Button CssClass="button btn-primary" Text="Submit" runat="server" ID="BtnSubmit" />
                </div><!-- end .form-footer section -->
            </form>
            
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
    
    <div></div><!-- end section -->

</body>
</html>
