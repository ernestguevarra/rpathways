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
