<%@page buffer="none" session="false" taglibs="c,cms" %>
<cms:formatter var="content" val="value">

<div class="box ${cms.element.settings.boxschema}">

	<%-- Title of the article --%>
	<c:if test="${cms.element.settings.hidetitle ne 'true'}">
		<h4>${value.Title}</h4>
	</c:if>	
	
	<div class="boxbody">
		<%-- Paragraphs of the article --%>
		<c:forEach var="paragraph" items="${content.valueList.Paragraph}">
		<div class="paragraph">
			<c:set var="showimg" value="false" />
			<c:if test="${paragraph.value.Image.exists}">
				<c:set var="showimg" value="true" />
				<c:set var="imgalign"><cms:elementsetting name="imgalign" default="${paragraph.value.Image.value.Align}" /></c:set>
				<c:set var="imgclass"></c:set>
				<c:set var="imgwidth">${(cms.container.width - 20) / 3}</c:set>
				<c:choose>
					<c:when test="${imgalign == 'top'}">
						<c:set var="imgwidth">${cms.container.width - 22}</c:set>
						<c:set var="imgclass">top</c:set>
					</c:when>
					<c:when test="${imgalign == 'left' || imgalign == 'lefthl'}">
						<c:set var="imgclass">left</c:set>
					</c:when>
					<c:when test="${imgalign == 'right' || imgalign == 'righthl'}">
						<c:set var="imgclass">right</c:set>
					</c:when>
				</c:choose>
			</c:if>
			<c:if test="${showimg && (imgalign == 'lefthl' || imgalign == 'righthl' || imgalign == 'top')}">
				<c:if test="${paragraph.value.Image.value.Enlarge == 'true'}"><a href="<cms:link>${paragraph.value.Image.value.Image}</cms:link>" class="thickbox" title="${paragraph.value.Image.value.Title}"></c:if>
				<cms:img src="${paragraph.value.Image.value.Image}" width="${imgwidth}" scaleColor="transparent" scaleType="0" cssclass="${imgclass}" alt="${paragraph.value.Image.value.Title}" title="${paragraph.value.Image.value.Title}" />
				<c:if test="${paragraph.value.Image.value.Enlarge == 'true'}"></a></c:if>
			</c:if>
			<%-- Optional headline of the paragraph --%>
			<c:if test="${paragraph.value.Headline.isSet}">
				<h5>${paragraph.value.Headline}</h5>
			</c:if>
			<c:if test="${showimg && (imgalign == 'left' || imgalign == 'right')}">
				<c:if test="${paragraph.value.Image.value.Enlarge == 'true'}"><a href="<cms:link>${paragraph.value.Image.value.Image}</cms:link>" class="thickbox" title="${paragraph.value.Image.value.Title}"></c:if>
				<cms:img src="${paragraph.value.Image.value.Image}" width="${imgwidth}" scaleColor="transparent" scaleType="0" cssclass="${imgclass}" alt="${paragraph.value.Image.value.Title}" title="${paragraph.value.Image.value.Title}" />
				<c:if test="${paragraph.value.Image.value.Enlarge == 'true'}"></a></c:if>
			</c:if>
			<c:choose>
				<c:when test="${cms.element.settings.keephtml == 'true'}">
					${paragraph.value.Text}
				</c:when><c:otherwise>
					${cms:trimToSize(cms:stripHtml(paragraph.value.Text), 300)}
				</c:otherwise>
			</c:choose>
		</div>
		</c:forEach>
	</div>
</div>

</cms:formatter>