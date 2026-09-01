def comp_paren(expre):
    stackPare = []
    cont_pare = 0
    if expre:
        stackPare.append(expre[0])
        for i in range(1, len(expre)):
            stackPare.append(expre[i])
            if len(stackPare) > 1:
                if stackPare[-2] == "(" and stackPare[-1] == ")":
                    stackPare.pop()
                    stackPare.pop()
                    cont_pare+=1
                elif stackPare[-2] == "[" and stackPare[-1] == "]": 
                    stackPare.pop()
                    stackPare.pop()
                    cont_pare+=1
                elif stackPare[-2] == "{" and stackPare[-1] == "}":
                    stackPare.pop()
                    stackPare.pop()
                    cont_pare+=1
        if not stackPare:
            return cont_pare
        else:
            return False
        

def main():
    expresion = input("Ingrese una expresion utilizando solamente ( [ { } ] ) para comprobar que sea valida la expresion: ")
    resultado = comp_paren(expresion)
    if resultado:
        print(f"La expresion dada es valida y tiene {resultado} pareja(s) de parentesis.")
    else:
        print("La expresion dada no es valida.")

if __name__ == "__main__":
    main()