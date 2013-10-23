<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="com.alkacon.bootstrap.schemas.imagegalleryshow">
<cms:formatter var="content" val="value" rdfa="rdfa">

<div class="gallery-page">

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery(".fancybox-button").fancybox({
            groupAttr: 'data-rel',
            prevEffect: 'none',
            nextEffect: 'none',
            closeBtn: true,
            helpers: {
                title: {
                    type: 'inside'
                    }
                }
            });
	});
</script>

	<c:if test="${not cms.element.settings.hidetitle}">
		<div class="headline"><h3 ${rdfa.Title}>${value.Title}</h3></div>
	</c:if>

	<c:choose>
		<c:when test="${cms.element.inMemoryOnly}">
			<div class="row"><div class="alert"><fmt:message key="bootstrap.imagegalleryshow.message.new" /></div></div>
		</c:when>
		<c:when test="${cms.edited}">
			<div class="row"><div class="alert"><fmt:message key="bootstrap.imagegalleryshow.message.edit" /></div></div>
		</c:when>
		<c:otherwise>

			<c:set var="imgFolder">${value.ImageFolder}</c:set>
			<c:set var="itemCount">${value.ImageCount.stringValue}</c:set>
			<cms:resourceload collector="allInFolder" param="%(pageContext.imgFolder)|image">
				<cms:contentinfo var="info" />
				<c:if test="${info.resultSize > 0}">
					<cms:resourceaccess var="res" />
					<c:if test="${info.resultIndex % itemCount == 1}">
						<div class="row margin-bottom-20">
					</c:if>

					<div class="col-md-<fmt:formatNumber type="number" value="${12 / itemCount}" maxFractionDigits="0" /> col-sm-6">
						<a class="thumbnail fancybox-button zoomer" data-rel="fancybox-button" title="<c:out value="${res.property['Title']}" />" href="<cms:link>${res.filename}</cms:link>">
							<span class="overlay-zoom">  
								<cms:img alt="${res.property['Title']}" src="${res.filename}" scaleType="2" scaleColor="transparent" scaleQuality="75" width="${720}" height="${450}" cssclass="img-responsive" />
								<div class="zoom-icon"></div>                   
							</span>                                              
						</a>                                                                                    
					</div>

					<c:if test="${info.lastResult}">
					<c:set var="missingItems">${info.resultSize - (info.resultIndex + 1)}</c:set>
						<div class="col-md-<fmt:formatNumber type="number" value="${(12 / itemCount) * missingItems}" maxFractionDigits="0" /> col-sm-6"></div>
					</c:if>

					<c:if test="${info.resultIndex % itemCount == 0 || info.lastResult}">
						</div>
					</c:if>
				</c:if>
			</cms:resourceload>

		</c:otherwise>

	</c:choose>
</div>

</cms:formatter>
</cms:bundle>