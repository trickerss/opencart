<?php echo $header; ?>      
    <nav><!--NAV-->
      <div class="navright">
        <a href="#" id="companyico"></a>
        <a href="#" id="connectico"></a>
        <a href="#" id="contactico"></a>
        <a href="javascript:buyProduct()" id="storeico"></a>
      </div>
    </nav><!--NAV-->

    <div class="wrapper"><!--WRAPPER-->
      
      <div class="main"><!--MAIN-->

        <section class="category"><!--PAGE 1-->
          <div id="myCarousel" class="carousel slide"><!--myCarousel-->
            <!-- Wrapper for slides -->
       <div class="carousel-inner">
        <?php 
        foreach($categories as $index => $category) { 
        ?>
           <div class="item <?php echo $index=='0'?'active':'';?>">
               <div class="fill" style="background-image:url('<?php echo $url.'image/'.$category['image']; ?>');"></div>
            </div>
            <?php } ?>              
        </div>
            <!-- Wrapper for slides -->         
          <a class="left carousel-control" href=".carousel-inner" data-slide="prev"><span class="fa fa-chevron-left"></span></a>
          <a class="right carousel-control" href=".carousel-inner" data-slide="next"><span class="fa fa-chevron-right"></span></a> 
          </div><!-- myCarousel -->

        </section><!--PAGE 1-->

        <?php foreach($products as $category_id => $product) { ?>
            
        <section id="<?php echo $category_id; ?>">
            <div id="myCarousel<?php echo $category_id; ?>" class="carousel slide">
            <!-- Wrapper for slides -->
            <div class="carousel-inner" >
            <?php 
            $ctr = 0;    
            foreach($product as $index => $per_product) {?>
              <div class="item <?php echo $ctr=='0'?'active':'';?>" select="<?php echo $per_product['product_id']; ?>">
                <div class="fill">
                  <div class="slideContent" style="position:absolute"> 

                    <div class="rightSide" style="float:right;">
                     <img src="<?php echo $per_product['image'];?>" alt="" class="prod-banner"/>
                    </div>       

                    <div class="leftSide" style="float:left;position:absolute;" >
                     <h1>All in love endures...</h1>
                     <div class="sub-head"><a href="">LEARN MORE</a> | <a href="">SHOP</a></div>
                     <div class="prod-img"><img src="img/enduranz.jpg" alt="" /></div>
                    </div>
                      <div style="clear:both"></div>                
                  </div> <!--close slide content-->      
                </div>
              </div><!--close item-->
             <?php $ctr++;
             } 
             ?>
               </div>

          <a class="left carousel-control" href="#myCarousel<?php echo $category_id; ?>" data-slide="prev"><span class="fa fa-chevron-circle-left"></span></a>
          <a class="right carousel-control" href="#myCarousel<?php echo $category_id; ?>" data-slide="next"><span class="fa fa-chevron-circle-right"></span></a> 
        </section>
            
        <?php } ?>
      </div><!--MAIN-->
    </div><!--WRAPPER-->
<!-- <div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $cols = 6; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $cols = 9; ?>
    <?php } else { ?>
    <?php $cols = 12; ?>
    <?php } ?>
    <div id="content" class="col-sm-<?php echo $cols; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
 -->
<script>
  function buyProduct() {
    
  }
</script>


<?php echo $footer; ?>