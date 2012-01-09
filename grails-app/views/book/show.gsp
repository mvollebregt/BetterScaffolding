<%@ page import="betterscaffolding.Book" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<gform:form bean="${bookInstance}" mode="show">
    <gform:field property="id"/>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="book.author.label" default="Author"/></td>

        <td valign="top" class="value"><g:link controller="author" action="show"
                                               id="${bookInstance?.author?.id}">${bookInstance?.author?.encodeAsHTML()}</g:link></td>

    </tr>

    <gform:field property="available"/>
    <gform:field property="publishingDate"/>
    <gform:field property="title"/>
</gform:form>
</body>
</html>
