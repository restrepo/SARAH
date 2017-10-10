# last update 13/01/2016

from object_library import all_orders, CouplingOrder


QCD = CouplingOrder(name = 'QCD',
                    expansion_order = 99,
                    hierarchy = 1)

QED = CouplingOrder(name = 'QED',
                    expansion_order = 99,
                    hierarchy = 2)

HIG = CouplingOrder(name = 'HIG',
                    expansion_order = 1,
                    hierarchy = 2)

HIW = CouplingOrder(name = 'HIW',
                    expansion_order = 1,
                    hierarchy = 2)
                    
BSM = CouplingOrder(name = 'BSM',
                    expansion_order = 1,
                    hierarchy = 2)                    