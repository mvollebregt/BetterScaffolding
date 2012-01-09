%{--
  - This file is part of BetterScaffolding.
  -
  - BetterScaffolding is free software: you can redistribute it and/or modify
  - it under the terms of the GNU General Public License as published by
  - the Free Software Foundation, either version 3 of the License, or
  - (at your option) any later version.
  -
  - BetterScaffolding is distributed in the hope that it will be useful,
  - but WITHOUT ANY WARRANTY; without even the implied warranty of
  - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  - GNU General Public License for more details.
  -
  - You should have received a copy of the GNU General Public License
  - along with BetterScaffolding.  If not, see <http://www.gnu.org/licenses/>.
  --}%

<%@ page import="betterscaffolding.Author" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<gform:form bean="${authorInstance}" mode="edit">
    <gform:field property="id" visible="show"/>
    <gform:field property="lastName"/>
    <gform:field property="firstName"/>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="books"><g:message code="author.books.label" default="Books"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'books', 'errors')}">

            <ul>
                <g:each in="${authorInstance?.books ?}" var="b">
                    <li><g:link controller="book" action="show"
                                id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
                </g:each>
            </ul>
            <g:link controller="book" action="create"
                    params="['author.id': authorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>

        </td>
    </tr>

    <gform:field property="gender"/>
</gform:form>

</body>
</html>
