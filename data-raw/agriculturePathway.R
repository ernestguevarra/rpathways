#
# ggdag
#
xx <- dagify(y ~ a + b + c,
             a ~ d , d ~ g, g ~ k,
             b ~ e, e ~ i, i ~ l + f + h, h ~ l + j, j ~~ k,
             c ~ f,
             k ~~ m, l ~~ m, f ~~ m, m ~ x,
             labels = c("a"= "Diet", "b" = "Health\n Status",
                        "c" = "Caring\n Capacity\n &\n Practices",
                        "d" = "Food\n Access", "e" = "Health\n Care",
                        "f" = "Women's\n Empowerment", "g" = "Processing\n &\n Storage",
                        "h" = "Food\n Expenditure", "i" = "Non-food\n Expenditure",
                        "j" = "Food\n Prices", "k" = "Food\n Production",
                        "l" = "Agricultural\n Income", "m" = "Agricultural\n Livelihoods",
                        "x" = "Household\n Assets\n and\n Livelihoods",
                        "y" = "Child\n Nutrition\n Outcomes"))

ggdag(xx,
      edge_type = "link_arc",
      text = FALSE,
      use_labels = "label",
      node_size = 8,
      label_size = 1) +
  theme_dag_blank()

yy <- dagify(y ~ a + b + c + n, n ~ f,
             a ~ d , d ~ g, g ~ k,
             b ~ e, e ~ i, i ~ l + f + h, h ~ l + j, j ~~ k,
             c ~ f,
             k ~~ m, l ~~ m, f ~~ m, m ~ x,
             labels = c("a"= "Diet", "b" = "Health\n Status",
                        "c" = "Caring\n Capacity\n &\n Practices",
                        "d" = "Food\n Access", "e" = "Health\n Care",
                        "f" = "Women's\n Empowerment", "g" = "Processing\n &\n Storage",
                        "h" = "Food\n Expenditure", "i" = "Non-food\n Expenditure",
                        "j" = "Food\n Prices", "k" = "Food\n Production",
                        "l" = "Agricultural\n Income", "m" = "Agricultural\n Livelihoods",
                        "x" = "Household\n Assets\n and\n Livelihoods",
                        "y" = "Mother\n Nutrition\n Outcomes"))

ggdag(yy, text = "FALSE", use_labels = "label") + theme_dag_blank()



#
# DiagrammeR - Graphviz
#
grViz("
  digraph agriculturePathway {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    c [label = '@@5'];
    d [label = '@@6'];
    e [label = '@@7'];
    f [label = '@@8'];
    g [label = '@@9'];
    h [label = '@@10'];
    i [label = '@@11'];
    j [label = '@@12'];
    k [label = '@@13'];
    l [label = '@@14'];
    m [label = '@@15'];
    n [label = '@@16'];
    x [label = '@@17'];

    k -> j [dir = both]
    k -> g
    j -> h
    g -> d
    l -> {h i}
    h -> i [dir = both][arrowsize = 0.5]
    h -> d
    i -> e
    d -> a
    e -> b
    a -> b [dir = both]
    {a b} -> y
    {a b} -> z
    f -> i
    f -> c
    f -> n
    n -> z
    c -> {y z}
    x -> m
    m -> {k l f} [dir = both]

    subgraph {
      rank = same; f; l; k;
    }

    subgraph {
      rank = same; h; i;
    }

    subgraph {
      rank = same; g; d; e; c;
    }

    subgraph {
      rank = same; a; b; n;
    }
  }

    [1]:  'Child Nutrition Outcomes'
    [2]:  'Mother Nutrition Outcomes'
    [3]:  'Diet'
    [4]:  'Health Status'
    [5]:  'Caring Capacity & Practices'
    [6]:  'Food Access'
    [7]:  'Health Care'
    [8]:  'Women Empowerment'
    [9]:  'Processing and Storage'
    [10]: 'Food Expenditure'
    [11]: 'Non-food Expenditure'
    [12]: 'Food Prices'
    [13]: 'Food Production'
    [14]: 'Agricultural Income'
    [15]: 'Agricultural Livelihoods'
    [16]: 'Female Energy Expenditure'
    [17]: 'Household Assets and Livelihoods'
")



grViz("
  digraph foodProduction {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    d [label = '@@5'];
    g [label = '@@6'];
    h [label = '@@7'];
    j [label = '@@8'];
    k [label = '@@9'];

    k -> j [dir = both]
    k -> g
    j -> h
    g -> d
    h -> d
    d -> a
    a -> b [dir = both][arrowsize = 0.5]
    {a b} -> y
    {a b} -> z

    subgraph {
      rank = same; j; h;
    }

    subgraph {
      rank = same; g; d;
    }

    subgraph {
      rank = same; a; b;
    }
  }

  [1]: 'Child Nutrition Outcomes'
  [2]: 'Mother Nutrition Outcomes'
  [3]: 'Diet'
  [4]: 'Health Status'
  [5]: 'Food Access'
  [6]: 'Processing and Storage'
  [7]: 'Food Expenditure'
  [8]: 'Food Prices'
  [9]: 'Food Production'
")


grViz("
  digraph agricultureIncome {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    d [label = '@@5'];
    e [label = '@@6'];
    h [label = '@@7'];
    i [label = '@@8'];
    l [label = '@@9'];

    l -> {h i}
    h -> i [dir = both][arrowsize = 0.5]
    h -> d
    i -> e
    d -> a
    e -> b
    a -> b [dir = both][arrowsize = 0.5]
    {a b} -> y
    {a b} -> z

    subgraph {
      rank = same; h; i;
    }

    subgraph {
      rank = same; d; e;
    }

    subgraph {
      rank = same; a; b;
    }
  }

  [1]:  'Child Nutrition Outcomes'
  [2]:  'Mother Nutrition Outcomes'
  [3]:  'Diet'
  [4]:  'Health Status'
  [5]:  'Food Access'
  [6]:  'Health Care'
  [7]: 'Food Expenditure'
  [8]: 'Non-food Expenditure'
  [9]: 'Agricultural Income'
")



grViz("
  digraph womenEmpowerment {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    c [label = '@@5'];
    d [label = '@@6'];
    e [label = '@@7'];
    f [label = '@@8'];
    h [label = '@@9'];
    i [label = '@@10'];
    n [label = '@@11'];

    h -> i [dir = both]
    h -> d
    i -> e
    d -> a
    e -> b
    a -> b [dir = both]
    {a b} -> y
    {a b} -> z
    f -> i
    f -> c
    f -> n
    n -> z
    c -> {y z}

    subgraph {
      rank = same; h; i;
    }

    subgraph {
      rank = same; d; e; c;
    }

    subgraph {
      rank = same; a; b; n;
    }
  }

  [1]:  'Child Nutrition Outcomes'
  [2]:  'Mother Nutrition Outcomes'
  [3]:  'Diet'
  [4]:  'Health Status'
  [5]:  'Caring Capacity & Practices'
  [6]:  'Food Access'
  [7]:  'Health Care'
  [8]:  'Women Empowerment'
  [9]:  'Food Expenditure'
  [10]: 'Non-food Expenditure'
  [11]: 'Female Energy Expenditure'
")


#
# DiagrammeR - Graphviz
#
grViz("
  digraph washPathway {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    a [label = '@@2'];
    b [label = '@@3'];
    c [label = '@@4'];
    d [label = '@@5'];
    e [label = '@@6'];
    f [label = '@@7'];
    g [label = '@@8'];
    h [label = '@@9'];
    i [label = '@@10'];
    j [label = '@@11'];
    k [label = '@@12'];
    l [label = '@@13'];
    m [label = '@@14'];
    n [label = '@@15'];
    o [label = '@@16'];
    p [label = '@@17'];
    q [label = '@@18'];
    r [label = '@@19'];
    s [label = '@@20'];

    {a b c g h} -> y
    {i j} -> c
    d -> a
    e -> b
    f -> b
    k -> {g h i}
    l -> j
    m -> {d e f}
    {n o p q} -> k
    r -> {l s}
    s -> m

    subgraph {
      rank = same; a; b;
    }

    subgraph {
      rank = same; c; d; e; f;
    }

    subgraph {
      rank = same; g; h; i; j;
    }

    subgraph {
      rank = same; k; l; m;
    }

    subgraph {
      rank = same; n; o; p; q; r; s;
    }
  }

  [1]:  'Child Nutrition Outcomes'
  [2]:  'Caregiving'
  [3]:  'Food Consumption'
  [4]:  'Anaemia'
  [5]:  'Time'
  [6]:  'Household Food Production'
  [7]:  'Water Expenditure'
  [8]:  'Diarrhoea'
  [9]:  'Enteric Infection'
  [10]: 'Protozoa/Helminth Infection'
  [11]: 'Malaria'
  [12]: 'Fecal contamination'
  [13]: 'Standing Water'
  [14]: 'Water Access'
  [15]: 'Latrines'
  [16]: 'Child faeces disposal'
  [17]: 'Animal penning'
  [18]: 'Septage Management'
  [19]: 'Water Resources'
  [20]: 'Water Supply'
")



#
# DiagrammeR - Graphviz
#
grViz("
  digraph carePathway {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
          style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    c [label = '@@5'];
    d [label = '@@6'];
    e [label = '@@7'];
    f [label = '@@8'];
    g [label = '@@9'];
    h [label = '@@10'];

    {a b} -> y
    {a b} -> z
    {c d} -> a
    {c d} -> b
    c -> d [dir = both]
    e -> {c d}
    f -> d
    g -> d
    h -> {e f g}

    subgraph {
      rank = same; a; b;
    }

    subgraph {
      rank = same; c; d;
    }

    subgraph {
      rank = same; e; f; g;
    }
  }

  [1]:  'Child Nutrition Outcomes'
  [2]:  'Mother Nutrition Outcomes'
  [3]:  'Incidence of Illnesses'
  [4]:  'Prevalence of Illnesses'
  [5]:  'Care Practices'
  [6]:  'Utilisation of Care Services'
  [7]:  'Knowledge of Care Practices'
  [8]:  'Awareness and Understanding of Care Services'
  [9]:  'Perception of Care Services'
  [10]: 'Community and Household Norms on Care Roles and Care-seeking'
")



#
# DiagrammeR - Graphviz
#
grViz("
  digraph healthPathway {

    # a 'graph' statement
    graph [overlap = false,
           fontsize = 12]

    # several 'node' statements
    node [shape = rectangle,
          fontname = Helvetica,
           style = filled]
    y [label = '@@1'];
    z [label = '@@2'];
    a [label = '@@3'];
    b [label = '@@4'];
    c [label = '@@5'];
    d [label = '@@6'];
    e [label = '@@7'];
    f [label = '@@8'];
    g [label = '@@9'];
    h [label = '@@10'];
    i [label = '@@11'];
    j [label = '@@12'];
    k [label = '@@13'];
    l [label = '@@14'];

    {a b} -> {y z}
    c -> {a b}
    d -> c
    {e f} -> d
    g -> d
    {h i} -> g
    j -> g
    {k l} -> j

    subgraph {
      rank = same; a; b;
    }

    subgraph {
      rank = same; k; l;
    }
  }

  [1]:  'Child Nutrition Outcomes'
  [2]:  'Mother Nutrition Outcomes'
  [3]:  'Incidence of Illnesses'
  [4]:  'Prevalence of Illnesses'
  [5]:  'Utilisation of Health Services'
  [6]:  'Acceptability of Health Services'
  [7]:  'Quality of Health Services'
  [8]:  'Appropriateness of Health Services'
  [9]:  'Accessiblity of Health Services'
  [10]: 'Cost of Health Services'
  [11]: 'Distance to Health Services'
  [12]: 'Availability of Health Services'
  [13]: 'Treatment Health Services'
  [14]: 'Preventive and Promotive Health Services'
")



