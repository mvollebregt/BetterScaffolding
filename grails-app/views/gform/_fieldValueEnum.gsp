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

<%--
  Created by IntelliJ IDEA.
  User: michel
  Date: 08-01-12
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>

<tr class="prop">
    <td valign="top" class="name"><g:message code="${code}" default="${defaultValue}"/></td>
    <td valign="top" class="value">${bean?.getProperty(property)?.encodeAsHTML()}</td>
</tr>
