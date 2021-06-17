package board;

import java.io.BufferedReader;

import oracle.sql.CLOB;

public class ClobTest {
	public static String clobToString(CLOB clob) throws Exception {
        StringBuffer s = new StringBuffer();
        BufferedReader br = new BufferedReader(clob.getCharacterStream());
        String ts = "";
        while((ts = br.readLine()) != null) {
               s.append(ts + "\n");
        }
        br.close();
        return s.toString();
 }

}
