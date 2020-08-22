import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.ArrayList;


//============================================================================================================
//   main function
//============================================================================================================

public class VMTranslator {

	public static void main(String[] args) {
		try
		{
			FileReader fr = new FileReader(args[0] + ".vm");
			BufferedReader br = new BufferedReader(fr);
			
			FileWriter fw = new FileWriter(args[0] + ".asm");
			BufferedWriter bw = new BufferedWriter(fw);
			
			CodeWriter code = new CodeWriter(bw, args[0]);
			
			while(true)
			{
				String line = br.readLine();
				if (line == null)
				{
					break;
				}
				Parser parse = new Parser(line);
				if (parse.pars.size() != 0)
				{
					switch (parse.commandType())
					{
					case "C_ARITHMETIC":
						System.out.println("***************");
						System.out.printf("(%s, %s)\n", parse.commandType(), parse.arg1());
						
						code.writeArithmetic(parse.arg1());						
						break;
					case "C_PUSH": case "C_POP":
						System.out.println("***************");
						System.out.printf("(%s, %s, %d)\n", parse.commandType(), parse.arg1(), parse.arg2());
						
						code.writePushPop(parse.commandType(), parse.arg1(), parse.arg2());					
						break;
					case "ERR":
						System.out.printf("(%d, %s, %d)\n", parse.commandType(), parse.arg1(), parse.arg2());
						break;
					}
					
				}
				
			}
			
			fr.close();
			fw.close();
		}
		catch (IOException ex) {
            System.out.println("檔案載入失敗");
        }
		

	}

}

//============================================================================================================
//  Parser class
//============================================================================================================

class Parser
{
	ArrayList<String>  pars = new ArrayList<String>();
	
	Parser(String line)
	{
		int ind = line.indexOf("//");
		line = line.substring(0, (ind == -1)? line.length() : ind ); // extract the string before comment
		//line = line.replace(" ", ""); // clear the space in string
		if (line.length() != 0)
		{				
			String[] segs = line.split(" ");
				
			for (String seg : segs)
			{
				if (seg.length() > 0)
				{
					this.pars.add(seg);
				}						
			}
		}
		
	} // end Constructor
	
	String commandType()
	{
		if (this.pars.size() == 1)
		{
			return "C_ARITHMETIC";
		}
		else if (this.pars.size() == 3)
		{
			switch (this.pars.get(0))
			{
			case "push":
				return "C_PUSH";

			case "pop":
				return "C_POP";

			default:
				return "OTHER";
			}
		}
		else
		{
			return "OTHER";
		}
	}// end commandType method
	
	String arg1()
	{
		
		switch (this.commandType())
		{
		case "C_ARITHMETIC":
			return this.pars.get(0);
		case "C_PUSH":
			return this.pars.get(1);
		case "C_POP":
			return this.pars.get(1);
		default:
			return "ERR";
		}
		
	} // end arg1 method
	
	int arg2()
	{
		switch (this.commandType())
		{
		case "C_PUSH":
			return  Integer.parseInt(this.pars.get(2));
		case "C_POP":
			return  Integer.parseInt(this.pars.get(2));
		default:
			return -1;
		}
	
	}// end arg2 method
} // end Parser class



//============================================================================================================
//     CodeWriter class
//============================================================================================================

class CodeWriter
{
	BufferedWriter bw;
	String vmFile;
	int countLabel; // for eq, gt, lt command's (END) label
	
	
	CodeWriter(BufferedWriter bw, String vmFile)
	{
		this.bw = bw;
		this.countLabel = 0; // count the (END) label
		this.vmFile = vmFile;
	}
	
	void writeArithmetic(String com)
	{
		
		try 
		{
			FileReader fr = new FileReader("implement/"+ com + ".asm");
			BufferedReader br = new BufferedReader(fr);
			
			boolean isLabel = false;
			while(true)
			{
				String line = br.readLine();				
				if (line == null)
				{
					break;
				}
				if (line.indexOf("END") != -1)
				{
					line = line.replace("END", "END" + Integer.toString(countLabel));
					isLabel = true;
				}
				System.out.println(line);
				this.bw.write(line);
				this.bw.newLine();
				this.bw.flush();
			}
			if (isLabel)
			{
				this.countLabel++;
			}
			fr.close();
			
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}

	}

	void writePushPop(String com, String memorySeg, int i)
	{
		
		try 
		{
			String readFile;
			switch (memorySeg)
			{
			case "local": case "argument": case "this": case "that":
				readFile = com + ".asm";
				break;
			case "constant": case "static": case "temp": case "pointer":
				readFile = memorySeg + com + ".asm";
				break;
			default:
				readFile = "xxxx";
			}
			
			FileReader fr = new FileReader("implement/" + readFile);
			BufferedReader br = new BufferedReader(fr);	
					
			while (true)
			{
				String line = br.readLine();
				
				if (line == null)
				{
					break;
				}
				
				switch (memorySeg)
				{
				// ********** Segment local, argument, this, that **********	
				case "local":
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
						line = line.replace("$s", "LCL");
					}					
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				case "argument":
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
						line = line.replace("$s", "ARG");
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				case "this":
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
						line = line.replace("$s", "THIS");
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				case "that":
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
						line = line.replace("$s", "THAT");
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
					
				// ********** Segment constant **********	
				case "constant":			

					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				// ********** Segment static **********	
				case "static":					
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$vm", this.vmFile);
						line = line.replace("$i", Integer.toString(i));
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				// ********** Segment temp **********	
				case "temp":
					if (line.indexOf("$") != -1)
					{
						line = line.replace("$i", Integer.toString(i));
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				// ********** Segment pointer **********	
				case "pointer":
					
					if (line.indexOf("$") != -1)
					{
						if (i == 0)
						{
							line = line.replace("$s", "THIS");
						}
						else if (i == 1)
						{
							line = line.replace("$s", "THAT");
						}
						else
						{
							System.out.println("vm command error");
						}					
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
					break;
				} // end switch				
			} // end while
			br.close();
		} // end try	
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}
			
	}// end writePushPop method
	
}// end codeWriter class