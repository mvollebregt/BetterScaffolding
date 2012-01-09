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

<tr class="prop">
    <td valign="top" class="name">
        <label for="${property}"><g:message code="${code}"
                                               default="${defaultValue}"/></label>
    </td>
    <td valign="top"
        class="value ${hasErrors(bean: bean, field: property, 'errors')}">
        <g:datePicker name="${property}" precision="day"
                      value="${bean?.getProperty(property)}"/>
    </td>
</tr>