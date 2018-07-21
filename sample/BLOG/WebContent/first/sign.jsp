<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
 </script>
<title>회원가입</title>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
</head>
</head>
<body>

<% 
		String userEmail = null;
		if(session.getAttribute("userEmail") !=null){
			userEmail = (String)session.getAttribute("userEmail");
		}
%>
<div id="jquery-script-menu">
<div class="jquery-script-center">
<ul>
<li><a href="https://www.jqueryscript.net/form/Powerful-Form-Validation-Plugin-For-jQuery-Bootstrap-3.html"></a></li>
<li><a href="https://www.jqueryscript.net/"></a></li>
</ul>
<div class="jquery-script-ads"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript" src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
<div class="jquery-script-clear"></div>
</div>
</div>
<div class="container" style="margin-top:150px;">
<div class="row"> 


<!-- form: -->
<section>
<div class="col-lg-8 col-lg-offset-2">
<div class="page-header">
<h2>아래의 칸을 작성해주세요.</h2>
</div>
<form method="post" class="form-horizontal" action="/BLOG/first/signAction.jsp">
<div class="form-group">
<label class="col-lg-3 control-label">E-mail</label>
<div class="col-lg-5">
<input type="email" class="form-control" name="userEmail" placeholder="Your Email" required autofocus>
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label">아이디</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userID" placeholder="Your ID" required autofocus>
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label">비밀번호</label>
<div class="col-lg-5">
<input type="password" class="form-control" name="userPassword" placeholder= "Your Password" required autofocus>
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label">닉네임</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userNickname" placeholder= "Your Nickname" required autofocus> 
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label">주소</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userAddress" placeholder="Your Address" required autofocus>
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label" id="captchaOperation"></label>
<div class="col-lg-2">
<input type="text" class="form-control" name="captcha" required autofocus>
</div>
</div>
<div class="form-group">
<div class="col-lg-9 col-lg-offset-3">
<button type="submit" class="btn btn-primary" value="성공이네욥.">성공이네욥.</button>
<button type="submit" class="btn btn-warning"><a href="/BLOG/main.jsp">나가기.</a></button>
</div>
</div>
</form>
</div>
</section>


<!-- :form --> 
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password can\'t be the same as each other'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password can\'t be the same as username'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password can\'t be the same as username'
                    }
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: 'Wrong answer',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>