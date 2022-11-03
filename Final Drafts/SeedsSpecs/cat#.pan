global optionsList, searchChoice
optionsList=""
searchChoice=""

optionsList="Cat# contains .1
Cat# contains .5
Cat# contains .9"

superchoicedialog optionsList, searchChoice, {
caption="What Do you you want to search by?"
}

case searchChoice contains ".1"
    select str(«cat #») contains ".1"
case searchChoice contains ".5"
    select str(«cat #») contains ".5"
case searchChoice contains ".9"
    select str(«cat #») contains ".9"
endcase