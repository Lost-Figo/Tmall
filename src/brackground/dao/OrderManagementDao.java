package brackground.dao;

import entity.TmOrder;
import entity.TmOrderItem;

import java.sql.SQLException;
import java.util.List;

public interface OrderManagementDao {
    //���������
    List<TmOrder> listalltmorder();
    //����������
    List<TmOrderItem> listalltmorderitem();
    //���붩����
    void addorder(TmOrder tmOrder);
    //���붩�����
    void addorderitem(TmOrderItem tmOrderItem);
    //���Ҷ���ĳ�����״̬����Ŀ
    int findnumbystatus(int number);
    //���Ҷ�������
    int ordernum() throws SQLException;
    //���ҽ����ܽ��
    double findamount() throws SQLException;
    //���ҽ��׳ɹ��Ķ�����
    int successorder() throws SQLException;
    //���ҽ���ʧ�ܶ�����Ŀ
    int failorder() throws SQLException;
    //�����˿���
    double tobackmoney() throws SQLException;
    //ĳ���·ݵ����ж���
    int ordernumbymonth(int month) throws SQLException;
    //ĳ���·ݴ���������ж���
    int ordernopaybymonth(int month) throws SQLException;
    //ĳ�����Ѹ�������ж���
    int orderpaidbymonth(int month) throws SQLException;
    //ĳ�����ѷ��������ж���
    int ordersendedbymonth(int month) throws SQLException;
    //���Ҹ���ʡ�ݵĶ�����
    int ordernumbyprovince(String province) throws SQLException;
    //����ĳһ������Ʒ��ռ����Ʒ���ı���
    double ordernumbytype(String type) throws SQLException;
    //���Ҷ����е�������Ʒ
    int ordernumall() throws SQLException;
}
