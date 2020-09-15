import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;


//============================================================================================================
//   main function
//============================================================================================================


public class VMTranslator {

	public static void main(String[] args)
	{
		try
		{
			String fileName = args[0];
			FileWriter fw = new FileWriter(fileName.replace(".vm", "") + ".asm");
			BufferedWriter bw = new BufferedWriter(fw);
			
			CodeWriter code = new CodeWriter(bw, fileName.replace(".vm", ""));

			String path = System.getProperty("user.dir") + "\\" + fileName;
			File file = new File(path);
			ArrayList<String> fileList = new ArrayList<String>();
			
			
			if (fileName.indexOf(".vm") != -1) // check if it is a directory (or .vm file)
			{
				fileList.add(fileName);
				path = System.getProperty("user.dir");
			}
			else
			{
				for (String tmp:file.list())
				{
					fileList.add(tmp);
				}
				
				path = System.getProperty("user.dir") + "\\" + fileName;
				System.out.println("DIR: " + path + "\\" + fileName);
				code.writeInit();
			}

			
			for (String f:fileList) // deal through each .vm file in the directory
			{
				
				
				
				if (f.indexOf(".vm") != -1) // find .vm file in directory
				{
					code.vmFile = f.replace(".vm", ""); // for static segment
					code.countLabel = 0; // refreshed in each .vm file
					code.countCall = 0;  // refreshed in each .vm file
					
					System.out.println(path + "\\" + f);
					
					FileReader fr = new FileReader(path+ "\\" + f);
					BufferedReader br = new BufferedReader(fr);
					
					while(true)
					{
						String line = br.readLine();
						if (line == null)
						{
							break;
						}
						Parser parse = new Parser(line); // split into several segments
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
							
							case "C_LABEL":
								System.out.println("***************");
								System.out.printf("(%s, %s)\n", parse.commandType(), parse.arg1());
								
								code.writeLabel(parse.arg1());
								break;
								
							case "C_GOTO":
								System.out.println("***************");
								System.out.printf("(%s, %s)\n", parse.commandType(), parse.arg1());
								
								code.writeGoto(parse.arg1());
								break;
								
							case "C_IF":
								System.out.println("***************");
								System.out.printf("(%s, %s)\n", parse.commandType(), parse.arg1());
								
								code.writeIf(parse.arg1());
								break;
								
							case "C_FUNCTION":
								System.out.println("***************");
								System.out.printf("(%s, %s, %d)\n", parse.commandType(), parse.arg1(), parse.arg2());
								
								code.currentFunction = parse.arg1();
								code.writeFunction(parse.arg1(), parse.arg2());
								
								break;
							
							case "C_CALL":
								System.out.println("***************");
								System.out.printf("(%s, %s, %d)\n", parse.commandType(), parse.arg1(), parse.arg2());
								
								code.countCall++;
								code.writeCall(parse.arg1(), parse.arg2());
								break;
								
							case "C_RETURN":
								System.out.println("***************");
								System.out.printf("(%s)\n", parse.commandType());
								
								code.writeReturn();

								break;
								
							case "ERR":
								System.out.printf("(%d, %s, %d)\n", parse.commandType(), parse.arg1(), parse.arg2());
								break;
							}
							
						}
						
					}
					
					fr.close();
					
					 
				} // end if (find .vm file in directory)
			} // end for loop (fileList)
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
					seg = seg.replace("\t", "");
					seg = seg.replace(" ", "");
					this.pars.add(seg);
				}						
			}
		}
		
	} // end Constructor
	
	String commandType()
	{
		if (this.pars.size() == 1)
		{
			switch (pars.get(0))
			{
			case "return":
				return "C_RETURN";
			default:
				return "C_ARITHMETIC";
			}
			
		}
		else if (this.pars.size() == 2)
		{
			switch (pars.get(0))
			{
			case "goto":
				return "C_GOTO";
			case "if-goto":
				return "C_IF";
			default:
				return "C_LABEL";
			}
		}
		else if (this.pars.size() == 3)
		{
			switch (this.pars.get(0))
			{
			case "push":
				return "C_PUSH";

			case "pop":
				return "C_POP";
			
			case "call":
				return "C_CALL";
				
			case "function":
				return "C_FUNCTION";

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
		case "C_CALL":
			return this.pars.get(1);
		case "C_FUNCTION":
			return this.pars.get(1);
		case "C_GOTO":
			return this.pars.get(1);
		case "C_IF":
			return this.pars.get(1);
		case "C_LABEL":
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
		case "C_CALL":
			return Integer.parseInt(this.pars.get(2));
		case "C_FUNCTION":
			return Integer.parseInt(this.pars.get(2));
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
	String vmFile; // for static segment
	String currentFunction;
	int countLabel; // for eq, gt, lt command's (END) label
	int countCall; // count the "call"
	
	
	CodeWriter(BufferedWriter bw, String vmFile)
	{
		this.bw = bw;
		this.countLabel = 0; // count the (END) label
		this.vmFile = vmFile;
		this.currentFunction = "";
		this.countCall = 0;
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
					line = line.replace("END", this.currentFunction + "$END" + Integer.toString(countLabel));
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
						line = line.replace("$seg", "LCL");
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
						line = line.replace("$seg", "ARG");
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
						line = line.replace("$seg", "THIS");
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
						line = line.replace("$seg", "THAT");
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
							line = line.replace("$seg", "THIS");
						}
						else if (i == 1)
						{
							line = line.replace("$seg", "THAT");
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
	
	void writeLabel(String label)
	{
		try
		{

			System.out.println("(" + this.currentFunction + "$" + label + ")");
			this.bw.write("(" + this.currentFunction + "$" + label + ")");
			this.bw.newLine();
			this.bw.flush();
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}
			
	}// end writeLabel method
	
	void writeGoto(String label)
	{
		try
		{
			System.out.println("@" + this.currentFunction + "$" + label + "\n0;JMP");
			this.bw.write("@" + this.currentFunction + "$" + label + "\n0;JMP");
			this.bw.newLine();
			this.bw.flush();
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}
			
	}// end writeGoto method
	
	void writeIf(String label)
	{
		try 
		{
			FileReader fr = new FileReader("implement/If.asm");
			BufferedReader br = new BufferedReader(fr);
			
			while(true)
			{
				String line = br.readLine();				
				if (line == null)
				{
					break;
				}
				if (line.indexOf("$") != -1)
				{
					line = line.replace("$currentFunction", this.currentFunction);
					line = line.replace("$label", "$" + label);
				}
				System.out.println(line);
				this.bw.write(line);
				this.bw.newLine();
				this.bw.flush();
			}
			fr.close();
			
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}

			
	}// end writeIf method
	
	void writeCall(String functionName, int nArgs)
	{
		try 
		{
			FileReader fr = new FileReader("implement/Call.asm");
			BufferedReader br = new BufferedReader(fr);
			
			while(true)
			{
				String line = br.readLine();				
				if (line == null)
				{
					break;
				}
				if (line.indexOf("$") != -1)
				{
					line = line.replace("$currentFunction", this.currentFunction);
					line = line.replace("$functionName", functionName);
					line = line.replace("$countCall", Integer.toString(this.countCall));
					line = line.replace("$nArgs", "$" + Integer.toString(nArgs));
				}
				System.out.println(line);
				this.bw.write(line);
				this.bw.newLine();
				this.bw.flush();
			}
			fr.close();
			
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}

			
	}// end writeCall method
	
	
	void writeFunction(String functionName, int nVars)
	{
		try 
		{
			System.out.println("(" + functionName + ")");
			this.bw.write("(" + functionName + ")");
			this.bw.newLine();
			this.bw.flush();
			
			
			for (int i = 0; i < nVars; i++)
			{ 
				FileReader fr = new FileReader("implement/Function.asm");
				BufferedReader br = new BufferedReader(fr);
				while(true)
				{
					String line = br.readLine();				
					if (line == null)
					{
						break;
					}
					System.out.println(line);
					this.bw.write(line);
					this.bw.newLine();
					this.bw.flush();
				}
				fr.close();
					
			}			
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}		
	}// end writeFunction method
	
	void writeReturn()
	{
		try 
		{
			FileReader fr = new FileReader("implement/Return.asm");
			BufferedReader br = new BufferedReader(fr);
			
			while(true)
			{
				String line = br.readLine();				
				if (line == null)
				{
					break;
				}
				System.out.println(line);
				this.bw.write(line);
				this.bw.newLine();
				this.bw.flush();
			}
			fr.close();
			
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}


	}// end writeReturn method
	
	void writeInit()
	{
		try
		{
			System.out.println("@256\nD=A\n@SP\nM=D");
			this.bw.write("@256\nD=A\n@SP\nM=D");
			this.bw.newLine();
			this.bw.flush();
			this.writeCall("Sys.init", 0);
		}
		catch (IOException ex) 
		{
			System.out.println("檔案載入失敗");
		}
	}// end writeInit method
	
	
}// end codeWriter class