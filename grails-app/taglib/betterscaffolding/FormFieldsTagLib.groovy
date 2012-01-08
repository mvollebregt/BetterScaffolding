package betterscaffolding

class FormFieldsTagLib {

    static namespace = "gform"

    /**
     * Renders a field.
     *
     * @attr bean     REQUIRED the bean object
     * @attr property REQUIRED the bean property
     */
    def field = { attrs, body ->
        def bean = attrs.bean
        def property = attrs.property;
        def fullClass = bean.class.name
        def shortClass = decapitalize(fullClass.substring(fullClass.lastIndexOf(".") + 1))
        def code = "${shortClass}.${property}.label"
        def defaultValue = decamelize(property)
        out << render(template:"/gform/fieldValue", model:[bean: bean, property: property, code: code, defaultValue: defaultValue])
    }

    /**
     * If shortClassName starts with one capital, changes first character into lower case.
     * Otherwise, leaves shortClassName as it is.
     */
    private String decapitalize(String shortClassName) {
        if (shortClassName.length() > 2 && Character.isUpperCase(shortClassName.charAt(1))) {
            shortClassName
        } else {
            shortClassName[0].toLowerCase() + shortClassName.substring(1)
        }
    }

    /**
     * Transforms camel case into single capitalized words.
     */
    private String decamelize(String propertyName) {
        return propertyName.
                replaceAll(~"\\p{javaLowerCase}\\p{javaUpperCase}", {"${it[0]} ${it[1]}"}).
                replaceAll(~"\\p{javaUpperCase}\\p{javaUpperCase}\\p{javaLowerCase}", {"${it[0]} ${it[1..2]}"}).
                capitalize();
    }

}
