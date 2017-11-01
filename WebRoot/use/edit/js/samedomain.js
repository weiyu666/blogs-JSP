////////////////////////////////////////////////////////////////////////////////
///Ãû³Æ£º¶àÃ½ÐÝ±à¼­Æ÷
///ÍøÖ·£ºhttp://www.avpx.net
///Edit By Mal
////////////////////////////////////////////////////////////////////////////////
function ResetDomain()
{	var ss=document.domain;						
	var ii=ss.lastIndexOf('.');
	if(ii>0)
	{	if(!isNaN(ss.substr(ii+1)*1))
			return;
		ii=ss.lastIndexOf('.',ii-1);
		if(ii>0)
			document.domain	=ss.substr(ii+1);
	}											
}
ResetDomain();