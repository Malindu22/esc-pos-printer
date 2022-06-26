/**
* Ipos ��ӡ����
* IPosPrinterService.aidl
* AIDL Version��1.0.0
*/

package com.iposprinter.iposprinterservice;
import  com.iposprinter.iposprinterservice.IPosPrinterCallback;
import  android.graphics.Bitmap;

interface IPosPrinterService {
    /**
    * ��ӡ��״̬��ѯ
    * @return ��ӡ����ǰ״̬
    * <ul>
    * <li>0:PRINTER_NORMAL ��ʱ���������µĴ�ӡ
    * <li>1:PRINTER_PAPERLESS  ��ʱֹͣ��ӡ�������ǰ��ӡδ��ɣ���ֽ�����ش�
    * <li>2:PRINTER_THP_HIGH_TEMPERATURE ��ʱ��ͣ��ӡ�������ǰ��ӡδ��ɣ���ȴ�󽫼�����ӡ�������ش�
    * <li>3:PRINTER_MOTOR_HIGH_TEMPERATURE ��ʱ��ִ�д�ӡ����ȴ����Ҫ��ʼ����ӡ�������·����ӡ����
    * <li>4:PRINTER_IS_BUSY    ��ʱ��ӡ�����ڴ�ӡ
    * <li>5:PRINTE_ERROR_UNKNOWN  ��ӡ���쳣
    */
    int getPrinterStatus();

    /**
    * ��ӡ����ʼ��
    * ��ӡ���ϵ粢��ʼ��Ĭ������
    * ʹ��ʱ���ѯ��ӡ��״̬��PRINTER_IS_BUSYʱ��ȴ�
    * @param callback ִ�н���ص�
    * @return
    */
    void printerInit(in IPosPrinterCallback callback);

    /**
    * ���ô�ӡ���Ĵ�ӡŨ�ȣ���֮���ӡ��Ӱ�죬���ǳ�ʼ��
    * @param depth:     Ũ�ȵȼ�,��Χ1-10,������Χ�˹��ܲ�ִ�� Ĭ�ϵȼ�6
    * @param callback ִ�н���ص�
    * @return
    */
    void setPrinterPrintDepth(int depth,in IPosPrinterCallback callback);

    /**
    * ���ô�ӡ�������ͣ���֮���ӡ��Ӱ�죬���ǳ�ʼ��
    * ��Ŀǰֻ֧��һ������ST���������ṩ���������֧�֣�
    * @param typeface:     �������� ST(����)
    * @param callback  ִ�н���ص�
    * @return
    */
    void setPrinterPrintFontType(String typeface,in IPosPrinterCallback callback);


    /**
    * ���ô�ӡ����ӡ�ַ��ı�����ϵ
    * (Ŀǰ֧��GBK��GB2312)
    * @param codingSystem: ������ϵ
    * @param callback  ִ�н���ص�
    * @return
    */
    //void setPrinterCharacterCodingSystem(String codingSystem,in IPosPrinterCallback callback);

	/**
	* ���������С, ��֮���ӡ��Ӱ�죬���ǳ�ʼ��
	* ע�⣺�����С�ǳ�����׼����ָ��Ĵ�ӡ��ʽ��
	* ���������С��Ӱ���ַ���ȣ�ÿ���ַ�����Ҳ����֮�ı䣬
	* ��˰��ȿ������γɵ��Ű���ܻ���ң������е���
	* @param fontsize:	�����С��Ŀǰ֧�ֵ�size��16��24��32��48������Ƿ�sizeִ��Ĭ��ֵ24
	* @param callback  ִ�н���ص�
	* @return
	*/
    void setPrinterPrintFontSize(int fontsize,in IPosPrinterCallback callback);

    /**
    * ���ö��뷽ʽ����֮���ӡ��Ӱ�죬���ǳ�ʼ��
    * @param alignment:	���뷽ʽ 0--���� , 1--����, 2--����,Ĭ�Ͼ���
    * @param callback  ִ�н���ص�
    * @return
    */
    void setPrinterPrintAlignment(int alignment, in IPosPrinterCallback callback);

    /**
    * ��ӡ����ֽ  (ǿ�ƻ��У�����֮ǰ�Ĵ�ӡ���ݺ���ֽlines�У���ʱ����ת��ֽ�������ݴ��͸���ӡ��)
    * @param lines��    ��ӡ����ֽ����(ÿ����һ�����ص�)
    * @param callback  ִ�н���ص�
    * @return
    */
    void printerFeedLines(int lines,in IPosPrinterCallback callback);

    /**
    * ��ӡ�հ���  (ǿ�ƻ��У�����֮ǰ�Ĵ�ӡ���ݺ��ӡ�հ��У���ʱ���͸���ӡ��������ȫ��0x00)
    * @param lines��    ��ӡ�հ����� �������100��
    * @param height��   �հ��еĸ߶�(��λ�����ص�)
    * @param callback  ִ�н���ص�
    * @return
    */
    void printBlankLines(int lines,int height,in IPosPrinterCallback callback);

    /**
    * ��ӡ����
    * ���ֿ����һ���Զ������Ű�
    * @param text:	Ҫ��ӡ�������ַ���
    * @param callback  ִ�н���ص�
    * @return
    */
    void printText(String text, in IPosPrinterCallback callback);

    /**
    * ��ӡָ���������ͺʹ�С�ı�����������ֻ�Ա�����Ч
    * ���ֿ����һ���Զ������Ű�
    * @param text:	Ҫ��ӡ�������ַ���
    * @param typeface:  �������� ST��Ŀǰֻ֧��һ�֣�
    * @param fontsize:	�����С��Ŀǰ֧�ֵ�size��16��24��32��48������Ƿ�sizeִ��Ĭ��ֵ24
    * @param callback  ִ�н���ص�
    * @return
    */
    void printSpecifiedTypeText(String text, String typeface,int fontsize,in IPosPrinterCallback callback);

    /**
    * ��ӡָ���������ͺʹ�С�ı�����������ֻ�Ա�����Ч
    * ���ֿ����һ���Զ������Ű�
    * @param text:	Ҫ��ӡ�������ַ���
    * @param typeface:  �������� ST��Ŀǰֻ֧��һ�֣�
    * @param fontsize:	�����С��Ŀǰ֧�ֵ�size��16��24��32��48������Ƿ�sizeִ��Ĭ��ֵ24
    * @param alignment:    ���뷽ʽ  (0����, 1����, 2����)
    * @param callback  ִ�н���ص�
    * @return
    */
    void PrintSpecFormatText(String text, String typeface, int fontsize, int alignment, IPosPrinterCallback callback);

	/**
	* ��ӡ����һ�У�����ָ���п����뷽ʽ
	* @param colsTextArr   �����ı��ַ�������
	* @param colsWidthArr  ���п������  �ܿ�Ȳ��ܴ���((384 / fontsize) << 1)-������+1��
	*                      (��Ӣ���ַ�����, ÿ�������ַ�ռ����Ӣ���ַ�, ÿ����ȴ���0),
	* @param colsAlign	        ���ж��뷽ʽ(0����, 1����, 2����)
	* @param isContinuousPrint   �Ƿ��������ӡ��� 1����������ӡ  0����������ӡ
	* ��ע: �������������鳤��Ӧ��һ��, ���colsTextArr[i]�Ŀ�ȴ���colsWidthArr[i], ���ı�����
	* @param callback  ִ�н���ص�
	* @return
	*/
	void printColumnsText(in String[] colsTextArr, in int[] colsWidthArr, in int[] colsAlign,int isContinuousPrint, in IPosPrinterCallback callback);

    /**
    * ��ӡͼƬ
    * @param alignment:	���뷽ʽ 0--���� , 1--����, 2--����, Ĭ�Ͼ���
    * @param bitmapSize �� λͼ��С�������С��Χ1~16,������ΧĬ��ѡ��10 ��λ��24bit
    * @param mBitmap: 	ͼƬbitmap����(�����384���أ������޷���ӡ���һص�callback�쳣����)
    * @param callback  ִ�н���ص�
    * @return
    */
    void printBitmap(int alignment, int bitmapSize, in Bitmap mBitmap, in IPosPrinterCallback callback);

	/**
	* ��ӡһά����
	* @param data: 		��������
	* @param symbology: 	��������
	*    0 -- UPC-A��
	*    1 -- UPC-E��
	*    2 -- JAN13(EAN13)��
	*    3 -- JAN8(EAN8)��
	*    4 -- CODE39��
	*    5 -- ITF��
	*    6 -- CODABAR��
	*    7 -- CODE93��
	*    8 -- CODE128
	* @param height: 		����߶�, ȡֵ1��16, ������ΧĬ��ȡ6��ÿ����λ����24�����ص�߶�
	* @param width: 		������, ȡֵ1��16, ������ΧĬ��ȡ12��ÿ����λ����24�����ص㳤��
	* @param textposition:	����λ�� 0--����ӡ����, 1--�����������Ϸ�, 2--�����������·�, 3--�������·�����ӡ
	* @param callback  ִ�н���ص�
	* @return
	*/
	void printBarCode(String data, int symbology, int height, int width, int textposition,  in IPosPrinterCallback callback);

	/**
	* ��ӡ��ά����
	* @param data:			��ά������
	* @param modulesize:	��ά����С(��λ:��, ȡֵ 1 �� 16 ),�������÷�ΧĬ��ȡֵ10
	* @param mErrorCorrectionLevel : ��ά����ȼ�(0:L 1:M 2:Q 3:H)
	* @param callback  ִ�н���ص�
	* @return
	*/
	void printQRCode(String data, int modulesize, int mErrorCorrectionLevel, in IPosPrinterCallback callback);

	/**
	*��ӡԭʼ��byte����
	* @param rawPrintData    Byte �������ݿ�
	* @param callback  ����ص�
	*/
	void printRawData(in byte[] rawPrintData, in IPosPrinterCallback callback);

	/**
	* ʹ��ESC/POSָ���ӡ
	* @param data	 ָ��
	* @param callback  ����ص�
	*/
	void sendUserCMDData(in byte[] data, in IPosPrinterCallback callback);

	/**
	* ִ�д�ӡ
	* ��ִ����ɸ���ӡ���ܷ�������Ҫִ�д˷�������ӡ������ִ�д�ӡ��
	* �˷���ִ��֮ǰ��Ҫ�жϴ�ӡ��״̬������ӡ������PRINTER_NORMAL�˷�����Ч������ִ�С�
	* @param feedlines: ��ӡ����ֽfreedlines����
	* @param callback  ����ص�
	*/
	void printerPerformPrint(int feedlines, in IPosPrinterCallback callback);
}
