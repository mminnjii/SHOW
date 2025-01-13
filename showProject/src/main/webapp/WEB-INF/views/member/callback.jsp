<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("UWoEpHIfCFQaFNyGegJk", "${contextPath}/member/naver");
  alert(naver_id_login.oauthParams.access_token);
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('age'));
    alert(naver_id_login.getProfileData('id'));
    alert(naver_id_login.getProfileData('birthday'));
    alert(naver_id_login.getProfileData('gender'));
    alert(naver_id_login.getProfileData('mobile'));
  }
</script>
</body>
</html>