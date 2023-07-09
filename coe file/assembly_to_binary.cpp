// Replace comma from last line by semicolon
#include<bits/stdc++.h>
using namespace std;

void find_and_append_reg_code(char * token, char * instruction);

void convert_int_to_nbit_binary (int val, int n, char * instruction);

int line_count = 0;
long curr_location;
string address_type;

int main(){
    FILE *fin, *fout;
    fin = fopen("assembly.txt", "r");
    if(fin==NULL){
        printf("assembly file does not exist");
    }
    fout = fopen("binary.coe", "w");

    fprintf(fout, "memory_initialization_radix=2;\n");
    fprintf(fout, "memory_initialization_vector=");
    unordered_map<string, int> label_adddress_map;
    unordered_map<string, map<long, string>> label_backpatch_list;
    map<long, int> pc_rel_address_mapper;
    int dec;
    char token[20], token_temp[20];
    char instruction[33];
    instruction[0] = '\0';
    while(fscanf(fin, "%s", token)!=EOF){
        if(!strcmp(token, "add")){
            //strcat(token, "");
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "000001");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "comp")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "000010");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "and")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "000011");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "xor")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "000100");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "diff")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "000101");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "shll")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            convert_int_to_nbit_binary(dec, 10, instruction);
            // find_and_append_reg_code(token, instruction);
            strcat(instruction, "000110");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "shrl")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            if(token[0]<=57 && token[0]>=48){
                strcat(instruction, "00000");
                dec = atoi(token);
                convert_int_to_nbit_binary(dec, 10, instruction);
                strcat(instruction, "000111");
            }
            else{
                find_and_append_reg_code(token, instruction);
                strcat(instruction, "0000000000");
                strcat(instruction, "001001");
            }
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "shllv")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            // convert_int_to_nbit_binary(dec, 10, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "001000");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "shra")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            convert_int_to_nbit_binary(dec, 10, instruction);
            // find_and_append_reg_code(token, instruction);
            strcat(instruction, "001010");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "shrav")){
            strcat(instruction, "000000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            // convert_int_to_nbit_binary(dec, 10, instruction);
            strcat(instruction, "0000000000");
            strcat(instruction, "001011");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "b")){
            strcat(instruction, "001111");
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec, 26, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "00000000000000000000000000,");
                // printf("%ld",curr_location);
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "abs"));
                    label_backpatch_list[token] = temp;
                    // cout << (*(temp.find(curr_location))).first << endl;
                    // cout << (*(*(label_backpatch_list.find(token))).second.find(curr_location)).first;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "abs")) ;
                }
                // fprintf(fout, ",");
            }
            // fscanf(fin, "%s", token);
            // fscanf(fin, "%s", token);
            // find_and_append_reg_code(token, instruction);
            // strcat(instruction, "0000000000");
            // strcat(instruction, "001011");
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "br")){
            strcat(instruction, "010000");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "000000000000000000000");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bltz")){
            strcat(instruction, "010001");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec - (line_count+1), 21, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "000000000000000000000,");
                pc_rel_address_mapper[curr_location] = line_count;
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "rel"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "rel")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bz")){
            strcat(instruction, "010010");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec - (line_count+1), 21, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "000000000000000000000,");
                pc_rel_address_mapper[curr_location] = line_count;
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "rel"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "rel")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bnz")){
            strcat(instruction, "010011");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec - (line_count+1), 21, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "000000000000000000000,");
                pc_rel_address_mapper[curr_location] = line_count;
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "rel"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "rel")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bl")){
            strcat(instruction, "010100");
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec, 26, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "00000000000000000000000000,");
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "abs"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "abs")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bcy")){
            strcat(instruction, "010101");
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec, 26, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "00000000000000000000000000,");
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "abs"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "abs")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "bncy")){
            strcat(instruction, "010110");
            fscanf(fin, "%s", token);
            if(label_adddress_map.find(token) != label_adddress_map.end()){
                dec = (*(label_adddress_map.find(token))).second;
                convert_int_to_nbit_binary(dec, 26, instruction);
                fprintf(fout, "\n%s,", instruction);
            }
            else{
                fprintf(fout, "\n%s", instruction);
                curr_location = ftell(fout);
                fprintf(fout, "00000000000000000000000000,");
                if(label_backpatch_list.find(token) == label_backpatch_list.end()){
                    map<long, string> temp;
                    temp.insert(pair<long, string>(curr_location, "abs"));
                    label_backpatch_list[token] = temp;
                }
                else{
                    (*(label_backpatch_list.find(token))).second.insert(pair<long, string>(curr_location, "abs")) ;
                }
            }
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "addi")){
            strcat(instruction, "111111");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            convert_int_to_nbit_binary(dec, 16, instruction);
            // find_and_append_reg_code(token, instruction);
            // strcat(instruction, "000110");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "compi")){
            strcat(instruction, "111110");
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            convert_int_to_nbit_binary(dec, 16, instruction);
            // find_and_append_reg_code(token, instruction);
            // strcat(instruction, "000110");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "lw")){
            strcat(instruction, "111101");
            fscanf(fin, "%s", token_temp);
            // strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            find_and_append_reg_code(token_temp, instruction);
            convert_int_to_nbit_binary(dec, 16, instruction);
            // find_and_append_reg_code(token, instruction);
            // strcat(instruction, "000110");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if(!strcmp(token, "sw")){
            strcat(instruction, "111100");
            fscanf(fin, "%s", token_temp);
            // strcat(instruction, "00000");
            fscanf(fin, "%s", token);
            fscanf(fin, "%d", &dec);
            fscanf(fin, "%s", token);
            fscanf(fin, "%s", token);
            find_and_append_reg_code(token, instruction);
            find_and_append_reg_code(token_temp, instruction);
            convert_int_to_nbit_binary(dec, 16, instruction);
            // find_and_append_reg_code(token, instruction);
            // strcat(instruction, "000110");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }
        else if (!strcmp(token, "return") || !strcmp(token, "exit")){
            strcat(instruction, "10110100000000000000000000000000");
            fprintf(fout, "\n%s,", instruction);
            instruction[0] = '\0';
        }




        else{
            label_adddress_map[token] = line_count;
            if(label_backpatch_list.find(token)!=label_backpatch_list.end()){
                map<long, string>:: iterator it;
                it = (*(label_backpatch_list.find(token))).second.end();
                for(it = (*(label_backpatch_list.find(token))).second.begin(); it != ((*(label_backpatch_list.find(token))).second).end(); it++){
                    curr_location = (*it).first;
                    address_type = (*it).second;
                    if(address_type == "abs"){
                        convert_int_to_nbit_binary((line_count+1), 26, instruction);
                        fseek(fout, curr_location, SEEK_SET);
                        fprintf(fout, "%s,", instruction);
                        instruction[0] = '\0';
                    }
                    else{
                        int temp_line_count = (*pc_rel_address_mapper.find(curr_location)).second;
                        convert_int_to_nbit_binary((line_count-(temp_line_count+1)), 21, instruction);
                        fseek(fout, curr_location, SEEK_SET);
                        fprintf(fout, "%s,", instruction);
                        instruction[0] = '\0';
                    }
                }
                fseek(fout, 0, SEEK_END);
            }
            line_count--;
        }
        line_count ++;
    }
    fclose(fin);
    fclose(fout);
    return 0;



}

void convert_int_to_nbit_binary (int val, int n, char * instruction){
    char  *converted;
    char temp[2];
    temp[1] = '\0';
    int t;
    if(val<0){
        t = pow(2, n);
        val = t + val;
    }
    converted = (char*)malloc((n+1)*sizeof(char));
    for(int i=0; i<n; i++){
        converted[i] = val%2 +'0';
        val/=2;
    }
    converted[n] = '\0';
    for(int i=n-1; i>=0; i--){
        temp[0] = converted[i];
        strcat(instruction, temp);
    }
}


void find_and_append_reg_code(char * token, char * instruction){
    if(!strcmp(token, "r0")){
        strcat(instruction, "00000");
    }
    else if(!strcmp(token, "r1")){
        strcat(instruction, "00001");
    }
    else if(!strcmp(token, "r2")){
        strcat(instruction, "00010");
    }
    else if(!strcmp(token, "r3")){
        strcat(instruction, "00011");
    }
    else if(!strcmp(token, "r4")){
        strcat(instruction, "00100");
    }
    else if(!strcmp(token, "r5")){
        strcat(instruction, "00101");
    }
    else if(!strcmp(token, "r6")){
        strcat(instruction, "00110");
    }
    else if(!strcmp(token, "r7")){
        strcat(instruction, "00111");
    }
    else if(!strcmp(token, "r8")){
        strcat(instruction, "01000");
    }
    else if(!strcmp(token, "r9")){
        strcat(instruction, "01001");
    }
    else if(!strcmp(token, "r10")){
        strcat(instruction, "01010");
    }
    else if(!strcmp(token, "r11")){
        strcat(instruction, "01011");
    }
    else if(!strcmp(token, "r12")){
        strcat(instruction, "01100");
    }
    else if(!strcmp(token, "r13")){
        strcat(instruction, "01101");
    }
    else if(!strcmp(token, "r14")){
        strcat(instruction, "01110");
    }
    else if(!strcmp(token, "r15")){
        strcat(instruction, "01111");
    }
    else if(!strcmp(token, "r16")){
        strcat(instruction, "10000");
    }
    else if(!strcmp(token, "r17")){
        strcat(instruction, "10001");
    }
    else if(!strcmp(token, "r18")){
        strcat(instruction, "10010");
    }
    else if(!strcmp(token, "r19")){
        strcat(instruction, "10011");
    }
    else if(!strcmp(token, "r20")){
        strcat(instruction, "10100");
    }
    else if(!strcmp(token, "r21")){
        strcat(instruction, "10101");
    }
    else if(!strcmp(token, "r22")){
        strcat(instruction, "10110");
    }
    else if(!strcmp(token, "r23")){
        strcat(instruction, "10111");
    }
    else if(!strcmp(token, "r24")){
        strcat(instruction, "11000");
    }
    else if(!strcmp(token, "r25")){
        strcat(instruction, "11001");
    }
    else if(!strcmp(token, "r26")){
        strcat(instruction, "11010");
    }
    else if(!strcmp(token, "r27")){
        strcat(instruction, "11011");
    }
    else if(!strcmp(token, "r28")){
        strcat(instruction, "11100");
    }
    else if(!strcmp(token, "r29")){
        strcat(instruction, "11101");
    }
    else if(!strcmp(token, "r30")){
        strcat(instruction, "11110");
    }
    else if(!strcmp(token, "r31")){
        strcat(instruction, "11111");
    }
    return;
}