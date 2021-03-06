<?php

class SimPageNav
{
    protected $id;
    protected $startChar;
    protected $prevChar;
    protected $nextChar;
    protected $endChar;

    /**
     * �����������
     * @param string $id        - ������� ID �������� <UL> - ������������ ���������
     * @param string $startChar - ����� ������ "� ������"
     * @param string $prevChar  - ����� ������ "�����"
     * @param string $nextChar  - ����� ������ "������"
     * @param string $endChar   - ����� ������ "� �����"
     */
    public function __construct( /*string*/ $id     = 'pagination',
        /*string*/ $startChar = '&laquo;',
        /*string*/ $prevChar  = '&lsaquo;',
        /*string*/ $nextChar  = '&rsaquo;',
        /*string*/ $endChar   = '&raquo;'  )
    {
        $this->id = $id;
        $this->startChar = $startChar;
        $this->prevChar  = $prevChar;
        $this->nextChar  = $nextChar;
        $this->endChar   = $endChar;
    }

    /**
     * �������� HTML - ��� ������������ ���������
     * @param int $all        - ������ ���-�� ��������� (���������� � ���������)
     * @param int $limit      - ���-�� ��������� �� ��������
     * @param int $start      - ������� �������� ���������
     * @param int $linkLimit  - ���������� ������ � ���������
     * @param string $varName - ��� GET - ���������� ������� ����� �������������� � �����. ���������.
     * @return string
     */
    public function getLinks( /*int*/ $all, /*int*/ $limit, /*int*/ $start, $linkLimit = 10, $varName = 'start' )
    {
        // ������� �� ������, ���� ����� ������ ��� ����� ���-�� ���� ��������� ������,
        // � ���� ����� = 0. 0 - ����� �������� "�� ��������� � ���������".
        if ( $limit >= $all || $limit == 0 ) {
            return NULL;
        }

        $pages     = 0;       // ���-�� ������� � ���������
        $needChunk = 0;       // ������ ������� � ������ ������ �����
        $queryVars = array(); // �����. ������ ���������� �� ������ �������
        $pagesArr  = array(); // ��������� ��� �������������� �������� ������� ���������
        $htmlOut   = '';      // HTML - ��� ������������ ���������
        $link      = NULL;    // ����������� ������

        // � ���� ����� �� ������ ������ ������ - ����� ��, ��� ��, �� �������
        // ������ �� ������ ��������, �� ��������� �� �� ���� GET-����������:
        parse_str($_SERVER['QUERY_STRING'], $queryVars ); //   &$queryVars

        // ������� ���� GET-����������
        if( isset($queryVars[$varName]) ) {
            unset( $queryVars[$varName] );
        }

        // ��������� ����� �� ������, ������� �� ��� �� ��������:
        $link  = $_SERVER['PHP_SELF'].'?'.http_build_query( $queryVars );

        //--------------------------------------------------------

        $pages = ceil( $all / $limit ); // ���-�� �������

        // ��������� ������: ���� - ��� ����� ��������, �������� - ��� �������� ��� ��.
        // ��������� ����� ����� � �������. � �������� � ����� = ���-�� ���������� �� ��������.
        for( $i = 0; $i < $pages; $i++) {
            $pagesArr[$i+1] = $i * $limit;
        }

        // ������ ��� �� �� �������� ���������� ������ ���-�� ������
        // ������ ������ �� ���������� [� ��������] => "��������" ��
        // ����� (�����)
        $allPages = array_chunk($pagesArr, $linkLimit, true);

        // �������� ������ ����� � ������� ��������� ������ ��������.
        // � ����� ������ �� ���� ���������� ������ ������:
        $needChunk = $this->searchPage( $allPages, $start );

        // ��������� ������ "� ������", "�����������" ------------------------------------------------

        if ( $start > 1 ) {
            $htmlOut .= '<li><a href="'.$link.'&'.$varName.'=0">'.$this->startChar.'</a></li>'.
                '<li><a href="'.$link.'&'.$varName.'='.($start - $limit).'">'.$this->prevChar.'</a></li>';
        } else {
            $htmlOut .= '<li><span>'.$this->startChar.'</span></li>'.
                '<li><span>'.$this->prevChar.'</span></li>';
        }
        // ������ ������� ������ �� ������� �����
        foreach( $allPages[$needChunk] AS $pageNum => $ofset )  {
            // ������ ������� �������� �� ��������:
            if( $ofset == $start  ) {
                $htmlOut .= '<li><span>'. $pageNum .'</span></li>';
                continue;
            }
            $htmlOut .= '<li><a href="'.$link.'&'.$varName.'='. $ofset .'">'. $pageNum . '</a></li>';
        }

        // ��������� ������ "���������", "� �����" ------------------------------------------------

        if ( ($all - $limit) >  $start) {
            $htmlOut .= '<li><a href="' . $link . '&' . $varName . '=' . ( $start + $limit) . '">' . $this->nextChar . '</a></li>'.
                '<li><a href="' . $link . '&' . $varName . '=' . array_pop( array_pop($allPages) ) . '">' . $this->endChar . '</a></li>';
        } else {
            $htmlOut .= '<li><span>' . $this->nextChar . '</span></li>'.
                '<li><span>' . $this->endChar . '</span></li>';
        }
        return '<ul id="'.$this->id.'">' . $htmlOut . '<ul>';
    }

    /**
     * ���� � ����� ����� ��������� ������� �� ��������� $needPage
     * @param array $pagesList ������ ������ (�������� ������� �������� �� ������ ������ �� ��������)
     * @param int $needPage - ��������
     * @return number ���� ����� � ������� ���� ������ ��������
     */
    protected function searchPage( array $pagesList, /*int*/$needPage )
    {
        foreach( $pagesList AS $chunk => $pages  ){
            if( in_array($needPage, $pages) ){
                return $chunk;
            }
        }
        return 0;
    }
}