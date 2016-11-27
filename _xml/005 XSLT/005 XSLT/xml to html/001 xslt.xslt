<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/> <!-- указуем метод трансформации -->
  <xsl:template match="/">заглавные или прописные буквы должны
    <!-- шаблон для корневого елемента -->
    <!-- Основной html документ. Тело -->
    <html>
      <head>
        <title>groups demo</title>
      </head>
      <body>
        <xsl:apply-templates />
        <!-- применить на этом месте другие
                                               (описаны ниже) шаблоны (рекурсивно) -->
      </body>
    </html>
  </xsl:template>

  <!-- Трансформация документа. описание содержания -->
  <xsl:template match="group">
    <!-- Обрабатываем тег group - корневой элемент -->
    <h1>
      GROUP: <xsl:value-of select="./@name" />
    </h1>
    <!-- название групы -->
    <font color="#FF0000">
      Specialization: <xsl:value-of select="./@spec"/> <!-- специализация -->
    </font>

    <!-- Строим таблицу с информацией о студентах -->
    <table border="1" style="bordercolor:#FF0000;">
      <tbody>
        <tr>
          <th>NameStudent</th>
          <th>Description</th>
        </tr>
        <xsl:apply-templates />
        <!-- применить на этом месте другие
                                               (описаны ниже) шаблоны (рекурсивно) -->
      </tbody>
    </table>
  </xsl:template>
  <!-- Создаем шаблон для трансформации данных о каждом студенте -->
  <xsl:template match="student">
    <!-- Обрабатываем теги student -->
    <tr>
      <td>
        <xsl:value-of select="@name"/>
      </td>
      <!-- имя и фамилия -->
      <td>
        <xsl:value-of select="."/>
      </td>
      <!-- Текстовое значение контекстного узла -->
    </tr>
  </xsl:template>
</xsl:stylesheet>
