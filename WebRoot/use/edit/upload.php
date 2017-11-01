<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style/defaultEditor.css">
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
}
-->
</style></head>
<script language="javascript">
  function check_type()
  {
    if(document.myform.imgname.value==""){
	  alert("请选择图片！");
	  return false;
	}
    else if(document.myform.imgname.value!="")
    {
      Ary=document.myform.imgname.value.split(".");
      Afiletype=Ary[Ary.length-1];
	  Afiletype=Afiletype.toUpperCase();   
	  if(Afiletype!="GIF" && Afiletype!="JPG" && Afiletype!="PNG")
	  {
	     alert("上传图片的格式不正确，必须为gif,png或jpg格式的图片！");
		 return false;
	  }
	} 
  }
</script>
<body>
<?
//require_once("../config/config.inc");
//require_once("../general/log.php");
   $action=$_POST['action'];
   if($action==""){
?>
<form action="upload.php" method="post" name="myform" enctype="multipart/form-data" onsubmit="Javascript:return check_type();">
<input type="file" name="imgname" size=20 />
<input type="submit" name="Submit" value="上传" />
<input name="action" type="hidden" id="action" value="1" />
<input type="hidden" name="MAX_FILE_SIZE" value="<?=(10*1024);?>" /> 
</form>
<?
   } 
   else {
   $tempfile=$_FILES['imgname']['tmp_name'];
   $tepnamed=$_FILES['imgname']['name'];
   $type=explode(".",$tepnamed);
   $imgtype=$type[count($type)-1];
   $tepname=time().$i.".".$imgtype;
   $uploadfile="../imageT/".$tepname;
   //logss::sys_error("tempfile= $tempfile ||||||||||  uploadfile=$uploadfile");
   if(!move_uploaded_file($tempfile,$uploadfile)){
	  echo "上传失败，请检查文件夹权限！";
	  exit();
   }
   else{
?>
   <script language="Javascript">
     parent.window.document.getElementById("imgurl").value='<? echo $uploadfile;?>';
	 document.location="upload.php";
   </script>
<?
   }
  }
?>
</body>
</html>
