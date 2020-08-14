import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.ArrayList;

class SymbolTable{
	ArrayList<String>  symbol = new ArrayList<String>();
	ArrayList<Integer>  value = new ArrayList<Integer>();
	
	int memoryLocation;
	
	SymbolTable() // constructor
	{
		memoryLocation = 16;
		// R0 ~ R15
		for (int i = 0; i < 16; i++)
		{
			symbol.add("R"+i);
			value.add(i);
		}
		// Screen
		symbol.add("SCREEN");
		value.add(16384);
		// Keyboard
		symbol.add("KBD");
		value.add(24576);
		// Others
		symbol.add("SP");
		value.add(0);
		symbol.add("LCL");
		value.add(1);
		symbol.add("ARG");
		value.add(2);
		symbol.add("THIS");
		value.add(3);
		symbol.add("THAT");
		value.add(4);	
	} // end constructor
	
	void addVariable(String variable)
	{
		this.symbol.add(variable);
		this.value.add(this.memoryLocation);
		this.memoryLocation++;
	}
	
	void addLabel(String label, int val)
	{
		this.symbol.add(label);
		this.value.add(val);
	}
	
	int lookUp(String symbol)
	{
		int ind = this.symbol.indexOf(symbol);
		if (ind != -1)
		{
			return this.value.get(ind);
		}
		else
		{
			return -1;
		}
	}
	
} // end of SymbolTable class 


class Parser
{
	String cInstruction;
	String[] tmp1;
	String[] tmp2;
	
	Parser(String cInstruction)
	{
		this.cInstruction = cInstruction;
		this.tmp1 = cInstruction.split(";");	
		this.tmp2 = tmp1[0].split("=");
	}
	
	String dest()
	{
		String dest = (tmp2.length == 2)? tmp2[0]:"";
		return dest;
	}
	
	String comp()
	{
		String comp = (tmp2.length == 2)? tmp2[1]:tmp2[0];
		return comp;
	}

	String jump()
	{
		String jump = (tmp1.length == 2)? tmp1[1]:"";
		return jump;
	}
} // end of Parser class

class Code
{
	String dest(String str)
	{
		String binCode = "";
		binCode += (str.indexOf("A") != -1)? "1":"0";
		binCode += (str.indexOf("D") != -1)? "1":"0";
		binCode += (str.indexOf("M") != -1)? "1":"0";
		return binCode;
	}
	
	String comp(String str)
	{
		String binCode;
		if (str.indexOf("M") == -1) // a = 0
		{
			binCode = "0"; // detect "M"
			switch (str) 
			{
			case "0":
				binCode += "101010";
				break;
			case "1":
				binCode += "111111";
				break;
			case "-1":
				binCode += "111010";
				break;
			case "D":
				binCode += "001100";
				break;
			case "A":
				binCode += "110000";
				break;
			case "!D":
				binCode += "001101";
				break;
			case "!A":
				binCode += "110001";
				break;
			case "-D":
				binCode += "001111";
				break;
			case "-A":
				binCode += "110011";
				break;
			case "D+1":
				binCode += "011111";
				break;
			case "A+1":
				binCode += "110111";
				break;
			case "D-1":
				binCode += "001110";
				break;
			case "A-1":
				binCode += "110010";
				break;
			case "D+A":
				binCode += "000010";
				break;
			case "D-A":
				binCode += "010011";
				break;
			case "A-D":
				binCode += "000111";
				break;
			case "D&A":
				binCode += "000000";
				break;
			case "D|A":
				binCode += "010101";
				break;
			}
		}
		else // a = 1
		{
			binCode = "1";
			switch (str) 
			{
			case "M":
				binCode += "110000";
				break;
			case "!M":
				binCode += "110001";
				break;
			case "-M":
				binCode += "110011";
				break;
			case "M+1":
				binCode += "110111";
				break;
			case "M-1":
				binCode += "110010";
				break;
			case "D+M":
				binCode += "000010";
				break;
			case "D-M":
				binCode += "010011";
				break;
			case "M-D":
				binCode += "000111";
				break;
			case "D&M":
				binCode += "000000";
				break;
			case "D|M":
				binCode += "010101";
				break;
			}
		}
		
		return binCode;
	}
	
	
	
	String jump(String str)
	{
		String bincode;
		switch (str){
		case "JGT":
			bincode = "001";
			break;

		case "JEQ":
			bincode = "010";
			break;

		case "JGE":
			bincode = "011";
			break;

		case "JLT":
			bincode = "100";
			break;

		case "JNE":
			bincode = "101";
			break;

		case "JLE":
			bincode = "110";
			break;

		case "JMP":
			bincode = "111";
			break;

		default:
			bincode = "000";
		}
		
		return bincode;
	}
} // end of Code class


public class HackAssembler {
	public static void main(String [] argv) throws IOException 
	{
		ArrayList<String>  processedASM = new ArrayList<String>();
		SymbolTable myTable = new SymbolTable();
		
		FileReader fr = new FileReader(argv[0]);
		BufferedReader br = new BufferedReader(fr);
		FileWriter fw = new FileWriter(argv[1]);  
        BufferedWriter bw = new BufferedWriter(fw);  
	
		
     // ***************** Add labels to symbol table **************************
        int lineIndex = 0; // number of next command line
		while(true) 
		{			
			String line = br.readLine();
			if (line != null) // null if ended file
			{
				
				int ind = line.indexOf("//");
				line = line.substring(0, (ind == -1)? line.length() : ind ); // extract the string before comment
				line = line.replace(" ", ""); // clear the space in string
				if (line.length() != 0)
				{					
					String label;
					if (line.indexOf("(") != -1)
					{
						// extract the label between '(' and ')'
						label = line.substring(line.indexOf("(")+1, line.indexOf(")"));
						if (myTable.lookUp(label) == -1)
						{
							// add label records next command line number to symbol table
							myTable.addLabel(label, lineIndex); 
						}
					}
					else
					{
						processedASM.add(line);
						lineIndex++; // update next command line number
					}
				}
			}
			else
			{
				break; //stop reading
			}
		}
					
		fr.close();

		
		// ***************** Print for Debug *******************
		/*for (int i = 0; i < processedASM.size(); i++ )
		{
			System.out.printf("%d: %s\n", i, processedASM.get(i));
		}*/
		/*
		for (int i = 0; i < myTable.symbol.size(); i++ )
		{
			System.out.println(myTable.symbol.get(i)+" "+myTable.value.get(i));
		}*/

		// ***************** Add variables to symbol table **************************
		
		String[]  ML = new String[processedASM.size()];
		
		for (int i = 0; i < processedASM.size(); i++) // Run through the processedASM
		{
			String line = processedASM.get(i);
			int ind = line.indexOf("@");
			if (ind != -1) // A instruction
			{
				line = line.replace("@", "");
				boolean is_num = true;
				String variable = line;
				
				try 
				{
					Integer.parseInt(variable);
			    }
				catch (NumberFormatException e) 
				{
					is_num = false;
			    }
				 
				if (!is_num)
				{
					if (myTable.lookUp(variable) == -1)
					{
						myTable.addVariable(variable);
					} 
					//System.out.println(myTable.lookUp(variable));
					ML[i] = line.replace(variable, Integer.toBinaryString(myTable.lookUp(variable)));
					while(ML[i].length() < 15) // filled with 0 until 15-bits
					{
						ML[i] = "0" + ML[i];
					}
				}
				else // is_num == true
				{
					ML[i] = Integer.toBinaryString(Integer.parseInt(line));
					while(ML[i].length() < 15) // filled with 0 until 15-bits
					{
						ML[i] = "0" + ML[i];
					}
				}
				ML[i] = "0" + ML[i]; // OP code of instruction
				System.out.printf("%d: %s\n", i, processedASM.get(i));
				System.out.println(ML[i]);
				bw.write(ML[i]);
				bw.newLine();
				bw.flush();
			}
			else // C instruction
			{
				Parser pars = new Parser(line);
				Code code = new Code();
				//System.out.printf("%s, %s, %s\n", pars.dest(), pars.comp(), pars.jump());
				ML[i] = "111" + code.comp(pars.comp()) + code.dest(pars.dest()) + code.jump(pars.jump());
				System.out.printf("%d: %s\n", i, processedASM.get(i));
				System.out.println(ML[i]);
				bw.write(ML[i]);
				bw.newLine();
				bw.flush();
			}
		}
		
		fw.close();
		/*
		for (int i = 0; i < myTable.symbol.size(); i++ )
		{
			System.out.println(myTable.symbol.get(i)+" "+myTable.value.get(i));
		}
		*/
		/*
		for (int i = 0; i < ML.length; i++ )
		{
			System.out.println(ML[i]);
		}
		*/
	
	}
}