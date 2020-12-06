## The still has lots of commodities ex - Petrol,labour costs etc
## So manually filtering out unnecessary commodities
foodData <- filter(finalData,(cm_name == "Wheat - Retail" |
                                      cm_name == "Wheat (mixed) - Retail" |
                                      cm_name == "Buckwheat - Retail" |
                                      cm_name == "Millet - Retail" |
                                      cm_name == "Sorghum - Retail" |
                                      cm_name == "Rice (low quality) - Retail" |
                                      cm_name == "Rice (high quality) - Retail" |
                                      cm_name == "Rice (regular, milled) - Retail" |
                                      cm_name == "Rice (basmati, broken) - Retail" |
                                      cm_name == "Sugar (white) - Retail" |
                                      cm_name == "Sugar (jaggery/gur) - Retail" |
                                      cm_name == "Pulses - Retail" |
                                      cm_name == "Oil (sunflower) - Retail" |
                                      cm_name == "Oil (mustard) - Retail" |
                                      cm_name == "Oil (groundnut) - Retail" |
                                      cm_name == "Oil (vegetable, packaged) - Retail" |
                                      cm_name == "Lentils (masur) - Retail" |
                                      cm_name == "Lentils (moong) - Retail" |
                                      cm_name == "Lentils (urad) - Retail" |
                                      cm_name == "Tea (black) - Retail" |
                                      cm_name == "Soybeans - Retail" |
                                      cm_name == "Groundnuts - Retail" |
                                      cm_name == "Maize (local) - Retail" |
                                      cm_name == "Rice (medium grain, imported) - Retail" 
))


