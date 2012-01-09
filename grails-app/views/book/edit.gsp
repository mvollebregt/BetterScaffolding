<%@ page import="betterscaffolding.Book" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<gform:form bean="${bookInstance}" mode="edit">
    <gform:field property="id" visible="show"/>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="author"><g:message code="book.author.label" default="Author"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'author', 'errors')}">
            <g:select name="author.id" from="${betterscaffolding.Author.list()}" optionKey="id"
                      value="${bookInstance?.author?.id}"/>
        </td>
    </tr>

    <gform:field property="available"/>
    <gform:field property="publishingDate"/>
    <gform:field property="title"/>
</gform:form>
</body>
</html>
