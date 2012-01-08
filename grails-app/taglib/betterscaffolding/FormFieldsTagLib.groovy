package betterscaffolding

import static org.codehaus.groovy.grails.commons.GrailsResourceUtils.VIEWS_DIR_PATH as VIEWS

class FormFieldsTagLib {

    static namespace = "gform"

    /**
     * Renders a field.
     *
     * @attr bean     REQUIRED the bean object
     * @attr property REQUIRED the bean property
     */
    def field = { attrs, body ->
        Object bean = attrs.bean
        String property = attrs.property;
        String beanClassName = classNameWithoutPackage(bean.class.name)
        Class propertyClass = bean.class.getMethod("get${property.capitalize()}").returnType
        String propertyClassName = classNameWithoutPackage(propertyClass.name)
        def messageCode = decapitalize("${beanClassName}.${property}.label")
        def defaultMessage = camelCaseToSpacedWords(property)
        def template = propertyClass.isEnum() ?
            tryTemplate("fieldValue${propertyClassName}", "fieldValueEnum", "fieldValue") :
            tryTemplate("fieldValue${propertyClassName}", "fieldValue")
        out << render(
                template: template,
                model: [bean: bean, property: property, code: messageCode, defaultValue: defaultMessage])
    }

    private String tryTemplate(Object[] templates) {
        def template = templates.find { new File(VIEWS, "gform/_${it}.gsp").exists() }
        if (template) {
            "/gform/${template}"
        } else {
          throw new FileNotFoundException("In template directory ${VIEWS}gform, templates ${templates} were not found")
        }
    }

    private String classNameWithoutPackage(String fullClass) {
        fullClass.substring(fullClass.lastIndexOf(".") + 1)
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
    private String camelCaseToSpacedWords(String propertyName) {
        return propertyName.
                replaceAll(~"\\p{javaLowerCase}\\p{javaUpperCase}", {"${it[0]} ${it[1]}"}).
                replaceAll(~"\\p{javaUpperCase}\\p{javaUpperCase}\\p{javaLowerCase}", {"${it[0]} ${it[1..2]}"}).
                capitalize();
    }

}
