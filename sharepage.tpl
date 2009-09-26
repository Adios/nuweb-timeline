<!-- destyle03	4a600375	1 //--> <!-- 2009/07/17 12:52:05 //-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> ##SITE_NAME## - ##SHOW_NAME## </title>
<!-- ##TEMP_SCRIPT_BEGIN## -->
<script src="http://static.simile.mit.edu/timeline/api-2.3.0/timeline-api.js?bundle=true" type="text/javascript"></script>
<script src="application.js" type="text/javascript"></script>
<script src="/sopedia/tiny_mce/plugins/media/jscripts/embed.js"></script>

<link href="/sopedia/tiny_mce/plugins/plugin_res.css" rel="stylesheet" type="text/css">
<script src="/sopedia/tiny_mce/plugins/plugin_res.js"></script>
<script src="/sopedia/tiny_mce/plugins/bgsound/include/bgsoundTM.js"></script>


<Script language="JavaScript" type="text/JavaScript">
var g_sACN = "##ADMIN_NAME##";
var g_sPath = "##SHARE_NAME##";
var nThumbsSize = ##THUMBS_SIZE##;
var g_sTempName = "destyle03";
if ( nThumbsSize < 100 ) nThumbsSize = 100;
<!--
function LimitImgSize(oElemImg)
{
	if ( oElemImg.width > nThumbsSize || oElemImg.height > nThumbsSize ) {
		if ( oElemImg.width > oElemImg.height )
			oElemImg.width = nThumbsSize ;
		else 
			oElemImg.height = nThumbsSize ;
	}
			
	parElem = oElemImg.parentElement.parentElement;
	parElem.width = nThumbsSize +10;
	parElem.height = nThumbsSize +10;
}

function GetParentNUItem(oElem) {
	while(oElem) {
		if ( oElem.id == "NUItem" ) break;
		oElem = oElem.parentElement ;
	}
	return oElem;
}

function GetNUWebItem(o) {
	var oI = GetParentNUItem(o);
	if (!oI) return null;
	
	var oEC = oI.getElementsByTagName("td");
	var l = oEC.length;
	for (x=0; x<l; x++) {
		if (oEC[x].name == "NUWeb_NUItem")
			return oEC[x];
	}
	return null;
}

function ShowImage(o) {
	var u = "";
	if ( navigator.appName.charAt(0) == "M" ) {
		var img = o.getElementsByTagName("img")[0];
		u = img.NUURL;
	}
	else
		u = o.href;
		
	sURL = "/cgi-bin/pv_album.php?UP=" + u;
	window.open(sURL,"","width=900,height=720,scrollbars=yes,resizable");
	return false;
}

function ShowArticle(o) {
	var u = "";
	if ( navigator.appName.charAt(0) == "M" ) {
		var o = GetNUWebItem(o);
		if (o) u = o.NUURL;
	}
	else
		u = o.href;
		
	if (u.length) {
		location = "/cgi-bin/pv_article.php?UP=" + u;
		return false;
	} 
		return true;
}

function ShowForum(o, rootidx)
{
	var o = GetNUWebItem(o);
	if (o)
	{
		sURL   = o.NUURL;
		aryURL = sURL.split("/");
		
		if (aryURL.length > 2)					//  at least three elements
		{ 	
			sLOC = "/";
			i = 1;
			for(; i+1<aryURL.length; i++) {
				if (aryURL[i].indexOf("Group")>=0 && rootidx--<=0)
					break;
				sLOC += aryURL[i] + "/";
			}
			sLOC += "forum_view.php?mode=far&path=";

			for(; i+1<aryURL.length; i++) {
				sLOC += aryURL[i] + "/";
			}
			sLOC += "&f=" + aryURL[i];
			window.location = sLOC;
		}
	}
	return false;
}

function ShowForumDir(o, rootidx)
{
	sURL   = o.href;
	aryURL = sURL.split("/");
	
	if (aryURL.length > 3)					//  at least four elements
	{ 	
		sLOC = "/";
		i = 3;
		for(; i+1<aryURL.length; i++) {
			if (aryURL[i].indexOf("Group")>=0 && rootidx--<=0)
				break;
			sLOC += aryURL[i] + "/";
		}
		if (i+1 < aryURL.length)
			sLOC += "?mode=fa&path=";

		for(; i+1<aryURL.length; i++) {
			sLOC += aryURL[i] + "/";
		}
		window.location = sLOC;
	}
	return false;
}

function ShowNormal(o) {
	return true;
}

function ChangeCaption(sElem)
{
	sElem.alt = sElem.alt.replace("[Tag]:","標籤 : ");
sElem.alt = sElem.alt.replace("[content]:","內容 : ");
sElem.alt = sElem.alt.replace("[time]:","時間 : ");
sElem.alt = sElem.alt.replace("[place]:","地點 : ");
sElem.alt = sElem.alt.replace("[photographer]:","攝影者 : ");
sElem.alt = sElem.alt.replace("[camera-equipment]:","攝影器材 : ");
sElem.alt = sElem.alt.replace("[camera setup]:","拍攝設定 : ");
sElem.alt = sElem.alt.replace("[DataSource]:","資料來源 : ");
sElem.alt = sElem.alt.replace("Flash used:","閃光燈:");
sElem.alt = sElem.alt.replace("Focal length:","焦長:");
sElem.alt = sElem.alt.replace("Exposure time:","曝光值:");

}

//##TEMP_COMMENT_BEGIN##
setTimeout(InitGuessBook,5000);
function InitGuessBook() {
	addHit();
}

function createXMLHttpRequest()
{
	var XMLhttpObject = null;
	try{
		XMLhttpObject = new XMLHttpRequest();
	}catch(e){
		try{
			XMLhttpObject = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				XMLhttpObject = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				return null;
			}
		}
	}
	return XMLhttpObject;
}

function addHit() {
	var xmlhttp = createXMLHttpRequest();
	if (xmlhttp) {
		sURL = "/cgi-bin/pv.exe?act=hit&k=" + g_sPath + "&cache=" + new Date().getTime();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var oElem = document.getElementById("HitCount");
				if(oElem) oElem.innerHTML = parseInt(xmlhttp.responseText,10);
			}
		}
		xmlhttp.open("GET", sURL, true);
		xmlhttp.send(null);
	}
}

function addRecommend() {
	var Win = window;
	var doc = document;
	
	var url = "%NUWeb_URL%%SYSDIR_NUPush%/push_edit.php?ci=G06&U=" + escape(Win.location) + "&T=" + encodeURIComponent(doc.title);
	var Shell = new ActiveXObject("WScript.Shell");
	var sPath = Shell.RegRead("HKLM\\Software\\Monkia\\NUWeb\\AppDir");
	Shell.run("\""+sPath+"\\NUBraimView.exe\" /PushEdit \"URL=" + url + "\"");
}


function Special2Html(sString) {
	sString = sString.replace("<","&lt;");
	sString = sString.replace(">","&gt;");
	sString = sString.replace("\"","&quot;");
	return sString;
}

// Message Board
function dc_Show() {
	if (section_comment.style.display == "none")
		section_comment.style.display = "inline";
	else
		section_comment.style.display = "none";
}

function dc_read_temp() {
	var css_b = ',style10,style30,mestyle04,destyle01,';
	var css_r = ',style28,mestyle02,';
	var tn = ','+g_sTempName+',';
	var css = '';
	if 		(css_b.indexOf(tn) > -1) css = 'dir_comment_b.css';
	else if (css_r.indexOf(tn) > -1) css = 'dir_comment_r.css';
	else 							 css = 'dir_comment.css';
	
	document.write('<link href="/template/common/'+css+'" rel="stylesheet" type="text/css" />');
	document.write('<div id="section_comment" style="display:none;"><img id="img" src="/template/common/image/wait.gif" align="absmiddle"> 讀取資料中…, 請稍後！ </div>');
	document.write('<iframe id=if_dc src="/cgi-bin/dir_comment.php?m=init&UP='+g_sPath+'" onload="dc_if_OnLoad();" style="display:none;"></iframe>');
	document.write('<iframe id=if_dc_upload name=if_dc_upload src="#" onload="dc_if_upload_OnLoad();" style="display:none;"></iframe>');
}

function dc_if_OnLoad() {
	section_comment.innerHTML = if_dc.document.body.innerHTML;
	var o = document.getElementById('CommentContent');
	o.innerHTML = "";
	
	setTimeout(dc_GetComment2, 5000);
}

function dc_if_g_cmn_OnLoad() {
	var oWait = document.getElementById('GetCommentWait');
	oWait.style.display = "none";
	
	var oC = document.getElementById('CommentContent');
	var oAS = parseInt(if_dc_g_cmn.document.body.innerHTML);
	
	var oCmnCount = document.getElementById('CommentCount');
	oCmnCount.innerHTML = oAS;
	
	var sData = if_dc_g_cmn.document.body.innerHTML;
	// delete first line (count line)
	var x = sData.indexOf('\n');
	sData = sData.substring(x,sData.length);
	
	oC.innerHTML = sData;
}

function dc_if_upload_OnLoad() {
	if (if_dc_upload.location == 'about:blank') 
		return;
		
	dc_GetComment('');
	
	var o = document.getElementById('cmn_form');
	if (o) {
		cmn_form.reset();
		cmn_form_echo.reset();
	}
	
	var oWait = document.getElementById('SendingWait');
	if (oWait) oWait.style.display = "none";
}

function dc_GetComment2() {
	dc_GetComment("");
}

function dc_GetComment(u) {
	var oWait = document.getElementById('GetCommentWait');
	if (oWait) oWait.style.display = "inline";
	
	if (u.length == 0)
		u = '/cgi-bin/dir_comment.php?m=g_cmn&UP=' + g_sPath;
	
	var o = document.getElementById('if_dc_g_cmn');
	if (o)
		if_dc_g_cmn.location = u;
	else
		document.body.insertAdjacentHTML('beforeEnd','<iframe heoght=200 id=if_dc_g_cmn src="'+u+'" onload="dc_if_g_cmn_OnLoad();" style="display:none;"></iframe>');
	
	return false;
}

function dc_checkData() {
	if (cmn_form.cmn_name.value.length == 0) {
		alert("請輸入 '姓名' 或 '暱稱'.");
		cmn_form.cmn_name.focus();
		return false;
	}
	
	if (cmn_form.cmn_title.value.length == 0) {
		alert("請輸入'標題'.");
		cmn_form.cmn_title.focus();
		return false;
	}
	
	if (cmn_form.cmn_content.value.length == 0) {
		alert("請輸入'內容'.");
		cmn_form.cmn_content.focus();
		return false;
	}
	
	var oWait = document.getElementById('SendingWait');
	oWait.style.display = "inline";
	
	return true;
}

function dc_checkData_Echo() {
	if (cmn_form_echo.cmn_content.value.length == 0) {
		alert("請輸入'內容'.");
		cmn_form_echo.cmn_content.focus();
		return false;
	}
	
	var oWait = document.getElementById('SendingWait');
	oWait.style.display = "inline";
	
	return true;
}

function dc_OnEcho(o) {
	var oItem = o.parentElement.parentElement.parentElement.parentElement;
	cmn_title.innerHTML = oItem.all('msg').innerHTML;
	cmn_form_echo.action = o.href;
	cmn_form_echo.style.display = "inline";
	
	cmn_form.style.display = "none";
}

function dc_OnDelete(o) {
	var oItem = o.parentElement.parentElement.parentElement.parentElement;
	var sT = oItem.all('msg_title').innerHTML;
	if (confirm('是否刪除 "'+ sT + "'?")) {
		var oWait = document.getElementById('SendingWait');
		oWait.style.display = "inline";
		
		if_dc_upload.location = o.href;
	}
}


//##TEMP_COMMENT_END##
//-->
</Script>

<!-- ##TEMP_SCRIPT_END## -->

<Script>
var bIE = navigator.appName == "Microsoft Internet Explorer";
if (bIE) document.write('<link href="/template/destyle03/basic.css" rel="stylesheet" type="text/css" />');
else document.write('<link href="/template/destyle03/basic_f.css" rel="stylesheet" type="text/css" />');
</Script>
<link href="/template/destyle03/bottom_design.css" rel="stylesheet" type="text/css" />
<link href="/template/destyle03/toping_design.css" rel="stylesheet" type="text/css" />
<link href="/template/destyle03/box_design.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="building"> 
  <!-- ##TEMP_TOPIMG_BEGIN## -->
  <div id="toping">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1%" class="m-left" ></td>
        <td width="98%" bgcolor="#FFFFFF">
          <div id="header" style="position: relative;">
             <div id="container01">
               <div id="ShareTemplate">
                <form id="form_ls" action="/cgi-bin/InternalSearch.php">
                    <input title="搜尋" class="top-word-1" size="16" value="站內搜尋" name="q" style="height:20;" onblur="if(this.value==''){this.value='站內搜尋'}" onfocus="if(this.value=='站內搜尋'){this.value=''}">  
				    <input type="submit" class="top-word-1" value=" 搜尋 "style="height:20;">
                  </form>
               </div>
              </div> 

             <!-- ##TEMP_TOOLBAR_BEGIN## -->
             <div id="TempToolBar" style="position: absolute; right: 5px; top: 20px;">
			<div id="BnRSS" style="FLOAT: right;padding-left:10;">
				<table onmouseover="style.textDecoration='underline';style.color='#999999';" onmouseout="style.textDecoration='none';style.color='#706447'" style="cursor:hand;font-size:10pt;color:#706447;FONT-FAMILY:'&#32048;&#26126;&#39636;';TEXT-DECORATION: none" onclick="window.open('/cgi-bin/sbs_genform.php?dirname=##SHARE_NAME##&uname=##REMOTE_USERNAME##&email=##REMOTE_USEREMAIL##','','left=100,top=100,width=600,height=300');" cellSpacing="0" cellPadding="0" border="0">
					<tr height="25">
						<td vAlign="center" align="right"><img width=16 src="/template/common/button/bt2_1.gif"></td>
						<td class="button-word" style="padding:0px 5px 0px 5px: white-space:nowrap;" vAlign="center" align="middle">訂 閱</td>
					</tr>
				</table>
			</div>
</div>
             <!-- ##TEMP_TOOLBAR_END## -->
          </div>
        </td>
        <td width="1%" class="m-right" >&nbsp;</td>
      </tr>
      <tr>
        <td class="down-left"></td>
        <td class="down-m"></td>
        <td class="down-right">&nbsp;</td>
      </tr>
  </table>
  </div>
  <!-- ##TEMP_TOPIMG_END## -->
  
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1%" class="top-left"></td>
    <td width="98%" class="top-m" ></td>
    <td width="1%" class="top-right"></td>
  </tr>
  <tr>
    <td class="m-left"></td>
    <td id="main">
    <!-- ##TEMP_DISPLAY_BEGIN## -->
    <div id="nudisplay">
        <!-- ##TEMP_DESCRIBE_BEGIN## --> 
		<div id="describe"> 
          <div id="DescDir">##DESC##</div>
          <div id="DescDir_Tools2"></div>

        </div>
		<!-- ##TEMP_DESCRIBE_END## -->  
        <!-- ##TEMP_COMMENT_BEGIN## -->
        <script type="text/javascript">dc_read_temp();</script>
        <!-- ##TEMP_COMMENT_END## -->
        <div id="shortcut">##SHORTCUT_LINK## </div>
        
		<div id="lview">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <!-- ##TEMP_LVIEW## -->
		  </table>
		</div>
		
    <!-- ##BEGINZONE DIR## -->        
		<div id="dir">
            <div id="ShareDirSub" >
              <div id="ShareDirSub_01"></div>
              <div id="ShareDirSub_02"><a href="##PARENT_DIR_URL##">「上一層」</a></div>
            </div>
        <!-- #BEGINZONE DIR_HEADER -->
        <!-- #ENDZONE DIR_HEADER -->
        <div id="line"></div> 
        <!-- #BEGINTABLE DIR_ITEM -->            
        <div id="ShareDirSubItem" >
              <table width="100%" border="0" cellspacing="2" cellpadding="2">
                <colgroup>
                  <col style="width:12px;">
                  <col style="width:25%;">
                  <col>
                  <col style="width:130px; text-align:right;">
                </colgroup>
                <tr>
                  <td><img src="/template/destyle03/images/icon/icon-3.gif" width="10" height="10" align="absmiddle" /></td>
                  <td><a href="##DIR_SHARE_EURL##" title="##DIR_TITLE##">##DIR_SHOW_NAME##</a></td>
                  <td>##DIR_DESCRIBE##</td>
                  <td class="date_style">##DIR_MDATE##</td>
                </tr>
              </table>            
              </div>
        <!-- #ENDTABLE DIR_ITEM -->
        <!-- #BEGINZONE DIR_FOOTER -->
        <!-- #ENDZONE DIR_FOOTER -->
        </div>
        
	<!-- ##ENDZONE DIR## -->
        
        
        <!-- #BEGINZONE IMAGE_HEADER -->
        <div id="image_box">          <div id="SharePictureBar">圖片</div>
          <div id="line"></div>
          <div id="SharePicture">
<!-- #ENDZONE IMAGE_HEADER -->
        <!-- #BEGINTABLE IMAGE_ITEM -->
          <div id="SharePictureItem" FileName="##I_SHARE_NAME##" NUURL="##I_SHARE_EURL##"> 
          <div id="showpic">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="##I_SHARE_EURL##" onClick="return ShowImage(this);"><img onload="ChangeCaption(this);LimitImgSize(this);" NUURL="##I_SHARE_EURL##" NUTitle="##I_SHARE_TITLE##" NUDesc="##I_SHARE_DESC##" border=0 src="##I_SHARE_THUMBS##" alt="檔名：##I_SHARE_NAME##
        標題：##I_SHARE_TITLE## 
        說明：##I_SHARE_DESC##"></a></td>
              </tr>
            </table>
          </div>
          <div id="pic_tittle">##I_SHARE_TITLE##</div>
          </div>
        <!-- #ENDTABLE IMAGE_ITEM -->
        <!-- #BEGINZONE IMAGE_FOOTER -->
          </div>
          <hr />
          <!-- #BEGINZONE IMAGEVAR_FOOTER -->
          <div id="IMAGEVAR_FOOTER"><a href="##I_MORE_URL##">##I_MORE_LABEL##</a></div>
          <!-- #ENDZONE IMAGEVAR_FOOTER -->
          <div id="IMAGE_FOOTER"></div>
        </div>
        <!-- #ENDZONE IMAGE_FOOTER -->
  
        
        <!-- #BEGINZONE FLV_HEADER -->
        <div id="flv_box">
           <div id="ShareFlvBar">影片</div>
           <div id="ShareFlv">
        <!-- #ENDZONE FLV_HEADER -->
        <!-- #BEGINTABLE FLV_ITEM -->
            <table id="NUItemFlv" width=100% border="0" cellpadding="0" cellspacing="0">
              <tr>
               <td width="30%">
                size : 
                <a href=# onclick="var o=parentElement.all('monFlash'); o.width=320; o.height=240; return false;" >320</a>, 
                <a href=# onclick="var o=parentElement.all('monFlash'); o.width=640; o.height=480; return false;" >640</a><br>
                <object id="monFlash" type="application/x-shockwave-flash" data="/template/common/player_flv_maxi.swf" width="320px" height="240px">
                  <param name="movie" value="/template/common/player_flv_maxi.swf" />
                  <param name="allowFullScreen" value="true" />
                  <param name="FlashVars" value="flv=##F_SHARE_EURL##&amp;srt=1&amp;showfullscreen=1&amp;showvolume=1&amp;showtime=1" />
                </object>

                  </td>
               <td id="ShareFlvItem" name="NUWeb_NUItem" FileName="##F_SHARE_NAME##" NUURL="##F_SHARE_EURL##" NUTitle="##F_SHARE_TITLE##" NUAcoTitle="##F_SHARE_ACOTITLE##" NUDesc="##F_SHARE_DESC##">
                    <img src="/template/destyle03/images/icon/cd_go.gif" width="16" height="16" align="absmiddle" border=0> <a href="##F_SHARE_EURL##" title="##F_SHARE_NAME##">##F_SHARE_NAME##</a><br>
                    <img src="/template/destyle03/images/icon/page_white_cd.gif" width="16" height="16" align="absmiddle"> ##F_FLV_DURATION##<br>
                    <span nowrap class="top-word-1">##F_SHARE_SIZEA##</span><br>
                    <span nowrap class="top-word-1">##F_SHARE_MDATE##</span> 
                </td>
              </tr>
            </table>
        <!-- #ENDTABLE FLV_ITEM -->
        <!-- #BEGINZONE FLV_FOOTER -->
          </div>
          <!-- #BEGINZONE FLVVAR_FOOTER -->
          <div id="FLVVAR_FOOTER"><a href="##F_MORE_URL##">##F_MORE_LABEL##</a></div>
          <!-- #ENDZONE FLVVAR_FOOTER -->
          <div id="FLV_FOOTER"></div>
        </div>
        <!-- #ENDZONE FLV_FOOTER -->
        
        <!-- #BEGINZONE MP3_HEADER -->
        <div id="mp3_box">
           <div id="ShareMp3Bar">MP3</div>
           <div id="ShareMp3">
        <!-- #ENDZONE MP3_HEADER -->
        <!-- #BEGINTABLE MP3_ITEM -->
             <table id="NUItem" width=100% border="0" cellpadding="0" cellspacing="0" >
                <colgroup>
                  <col style="width:20px">
                  <col style="width:35%;">
                  <col>
                  <col style="width:70px;">
                  <col style="width:150px;">
                </colgroup>
              <tr>
                <td><A href="##M_SHARE_EURL##"><img src="/template/destyle03/images/icon/cd_go.gif" width="16" height="16" align="absmiddle" ></A></td>
                <td id="ShareMp3Item" name="NUWeb_NUItem" NUURL="##M_SHARE_EURL##" NUTitle="##M_MP3_ACOTITLE##" NUDesc="##M_MP3_DESC##"><A href="##M_SHARE_EURL##"> ##M_SHARE_NAME## </A></td>
                <td>
                  <img src="/template/destyle03/images/icon/cd.gif" width="16" height="16" align="absmiddle">&nbsp;##M_MP3_ALBUM## 
                  <img src="/template/destyle03/images/icon/page_white_cd.gif" width="16" height="16" align="absmiddle">&nbsp;##M_MP3_TITLE## 
                  <img src="/template/destyle03/images/icon/user.gif" width="16" height="16" align="absmiddle">&nbsp;##M_MP3_ARTIST## 
                  <img src="/template/destyle03/images/icon/clock.gif" width="16" height="16" align="absmiddle">&nbsp;##M_MP3_YEAR##
                </td>
              <td align="right">##M_SHARE_SIZEA##</td>
              <td align="center" class="date_style">##M_SHARE_MDATE##</td>
              </tr>
            </table>
        <!-- #ENDTABLE MP3_ITEM -->
        <!-- #BEGINZONE MP3_FOOTER -->
           </div>
           <!-- #BEGINZONE MP3VAR_FOOTER -->
           <div id="MP3VAR_FOOTER"><a href="##M_MORE_URL##">##M_MORE_LABEL##</a></div>
           <!-- #ENDZONE MP3VAR_FOOTER -->
           <div id="MP3_FOOTER"></div>
        </div>
        <!-- #ENDZONE MP3_FOOTER -->
        
        <!-- ##TEMP_HTML## -->
        <!-- #BEGINZONE HTML_HEADER -->
        <div id="html_box">
           <div id="ShareHTMLBar">文章</div>
           <div id="ShareWriting">
        <!-- #ENDZONE HTML_HEADER -->
        <!-- #BEGINTABLE HTML_ITEM -->
             <table id="NUItem" width=100% border="0" cellpadding="0" cellspacing="0" >
                <colgroup>
                  <col style="width:20px;">
                  <col style="width:35%;">
                  <col>
                  <col style="width:70px;">
                  <col style="width:150px;">
                </colgroup>
              <tr>
                <td align="center"><img width=16 src="/template/destyle03/images/icon/page.gif" align="absmiddle" style="cursor:hand;" onclick="ShowArticle(this);"></td>
                <td id="ShareWritingItem" name="NUWeb_NUItem" FileName="##H_SHARE_NAME##" NUURL="##H_SHARE_EURL##" NUTitle="##H_SHARE_TITLE##" NUAcoTitle="##H_SHARE_ACOTITLE##" NUDesc="##H_SHARE_DESC##">
			        <A href="##H_SHARE_EURL##" target="_blank" title="##H_SHARE_NAME##" onclick="return ShowArticle(this);">
			          ##H_SHARE_TITLE##</A></td>
                <td>##H_SHARE_DESC##</td>
			          <td align="right">##H_SHARE_SIZEA##</td>
			          <td align="center" class="date_style">##H_SHARE_MDATE##</td>
              </tr>
            </table>
        <!-- #ENDTABLE HTML_ITEM -->
        <!-- #BEGINZONE HTML_FOOTER -->
           </div>
           <!-- #BEGINZONE HTMLVAR_FOOTER -->
           <div id="HTMLVAR_FOOTER"><a href="##H_MORE_URL##">##H_MORE_LABEL##</a></div>
           <!-- #ENDZONE HTMLVAR_FOOTER -->
           <div id="HTML_FOOTER"></div>
        </div>
        <!-- #ENDZONE HTML_FOOTER -->
        
        <!-- ##TEMP_DOCUMENT## -->
        <!-- #BEGINZONE DOCUMENT_HEADER -->
        <div id="document_box"> 
           <div id="ShareDocumentBar">文件</div>
           <div id="ShareDocument">
        <!-- #ENDZONE DOCUMENT_HEADER -->
        <!-- #BEGINTABLE DOCUMENT_ITEM -->
             <table id="NUItem" width=100% border="0" cellpadding="0" cellspacing="0" >
                <colgroup>
                  <col style="width:20px;">
                  <col style="width:35%;">
                  <col>
                  <col style="width:70px;">
                  <col style="width:150px;">
                </colgroup>
                <tr>
                  <td align="center"><img width=16 src="/template/destyle03/images/icon/page.gif" align="absmiddle"></td>
                  <td id="ShareDocumentItem" name="NUWeb_NUItem" FileName="##D_SHARE_NAME##" NUURL="##D_SHARE_EURL##" NUTitle="##D_SHARE_TITLE##" NUAcoTitle="##D_SHARE_ACOTITLE##" NUDesc="##D_SHARE_DESC##"><A href="##D_SHARE_EURL##" title="##D_SHARE_NAME##">##D_SHARE_NAME##</A></td>
			            <td>##D_SHARE_DESC##</td>
			            <td align="right">##D_SHARE_SIZEA##</td>
			            <td align="center" class="date_style">##D_SHARE_MDATE##</td>
                </tr>
              
            </table>
        <!-- #ENDTABLE DOCUMENT_ITEM -->
        <!-- #BEGINZONE DOCUMENT_FOOTER -->
           </div>
           <!-- #BEGINZONE DOCVAR_FOOTER -->
           <div id="DOCVAR_FOOTER"><a href="##D_MORE_URL##">##D_MORE_LABEL##</a></div>
           <!-- #ENDZONE DOCVAR_FOOTER -->
           <div id="DOCUMENT_FOOTER"></div>
        </div>
        <!-- #ENDZONE DOCUMENT_FOOTER -->
        
     
        <!-- #BEGINZONE NORMAL_HEADER -->
        <div id="normal_box">
           <div id="ShareOtherBar">其他</div>
           <div id="ShareOther">
        <!-- #ENDZONE NORMAL_HEADER -->
        <!-- #BEGINTABLE NORMAL_ITEM -->
             <table id="NUItem" width=100% border="0" cellpadding="0" cellspacing="0" >
                <colgroup>
                  <col style="width:20px;">
                  <col style="width:35%;">
                  <col>
                  <col style="width:70px;">
                  <col style="width:150px;">
                </colgroup>
                <tr>
                  <td align="center" ><img width="16" src="/template/destyle03/images/icon/application.gif" align="absmiddle"></td>
                  <td id="ShareOtherItem" name="NUWeb_NUItem" FileName="##N_SHARE_NAME##" NUURL="##N_SHARE_EURL##" NUTitle="##N_SHARE_TITLE##" NUDesc="##N_SHARE_DESC##"><A href="##N_SHARE_EURL##" onclick="return ShowNormal(this);">##N_SHARE_NAME##</A></td>
			            <td>##N_SHARE_DESC##</td>
			            <td align="right">##N_SHARE_SIZEA##</td>
			            <td align="center" class="date_style">##N_SHARE_MDATE##</td>
                </tr>
            </table>
        <!-- #ENDTABLE NORMAL_ITEM -->
        <!-- #BEGINZONE NORMAL_FOOTER -->
           </div>
		   <!-- #BEGINZONE NORMALVAR_FOOTER -->
           <div id="NORMALVAR_FOOTER"><a href="##N_MORE_URL##">##N_MORE_LABEL##</a></div>
           <!-- #ENDZONE NORMALVAR_FOOTER -->
           <div id="NORMAL_FOOTER"></div>
        </div>
        <!-- #ENDZONE NORMAL_FOOTER -->
        
        
        <!-- #BEGINZONE EMPTY -->
        <!-- #ENDZONE EMPTY -->
        
        
   </div>
   <!-- ##TEMP_DISPLAY_END## -->
   
   <div id="bottom_img"> </div> 
    </td>
    <td class="m-right"></td>
  </tr>
  <tr>
    <td class="down-left"></td>
    <td class="down-m"></td>
    <td class="down-right"></td>
  </tr>
</table>


<div id="page_bar">
<!-- #BEGINZONE PAGE_BAR -->
	<table border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr> 
		<!-- #BEGINZONE FIRST_PAGE -->
	    <td class="word2"><a href="##FIRST_PAGE_URL##" onMouseOver="all('BnImage').src='/template/common/image/arrows-first-b.gif'" onMouseOut="all('BnImage').src='/template/common/image/arrows-first.gif'"><img src="/template/common/image/arrows-first.gif" border="0" id="BnImage"></a></td>
		<!-- #ENDZONE FIRST_PAGE -->
	    <!-- #BEGINZONE PREV_PAGE -->
	    <td class="word2"><a href="##PREV_PAGE_URL##" onMouseOver="all('BnImage').src='/template/common/image/arrows-back-b.gif'" onMouseOut="all('BnImage').src='/template/common/image/arrows-back.gif'"><img src="/template/common/image/arrows-back.gif" border="0" id="BnImage"></a></td>
	    <!-- #ENDZONE PREV_PAGE -->
	
	    <!-- #BEGINTABLE PAGE_ITEM -->
	    <td class="word">
		    <!-- #BEGINZONE PAGE_URL_HEADER -->
	        <A HREF="##PAGE_URL##">
	        <!-- #ENDZONE PAGE_URL_HEADER -->
	        ##PAGE_LABEL##
	        <!-- #BEGINZONE PAGE_URL_FOOTER -->
	        </A>
	        <!-- #ENDZONE PAGE_URL_FOOTER -->
		</td>
	    <!-- #ENDTABLE PAGE_ITEM -->
	
	    <!-- #BEGINZONE NEXT_PAGE -->
	    <td class="word2"><a href="##NEXT_PAGE_URL##" style="text-decoration:underline;" onMouseOver="all('BnImage').src='/template/common/image/arrows-next-b.gif'" onMouseOut="all('BnImage').src='/template/common/image/arrows-next.gif'"><img src="/template/common/image/arrows-next.gif" border="0" id="BnImage"></a></td>
	    <!-- #ENDZONE NEXT_PAGE -->
	    <!-- #BEGINZONE LAST_PAGE -->
	    <td class="word2"><a href="##LAST_PAGE_URL##" onMouseOver="all('BnImage').src='/template/common/image/arrows-last-b.gif'" onMouseOut="all('BnImage').src='/template/common/image/arrows-last.gif'"><img src="/template/common/image/arrows-last.gif" border="0" id="BnImage"></a></td>
	    <!-- #ENDZONE LAST_PAGE -->
	  </tr>
	</table>
	<div>&nbsp;</div>
<!-- #ENDZONE PAGE_BAR -->
</div>


</div>

<!-- ##TEMP_OTHER_BEGIN## -->


<!-- ##TEMP_OTHER_END## -->

   
</body>
</html>
