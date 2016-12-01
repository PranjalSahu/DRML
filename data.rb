def get_data(la, lb, b)
    allh = {}
    b.each do |t|
        txt = File.open("/Users/pranjal/Downloads/cohndata/FACS/"+t).read()
        name = t.split("/")[2].split("_facs.txt")[0]
        allh[name]  = txt
    end
    
    pq = []
    co = 0
    val9  = []
    val27 = []
    
    
    allh.each do |k, a|
        pr =  a.split("\n")
        flag9 = false
        flag27 = false
        
        pr.each do |p|
            pl = p.split(" ")
            if pl[0].to_f.to_i == la
                val9 << k.split("_")[0]+"_"+k.split("_")[1]
            end
            if pl[0].to_f.to_i == lb
                val27 << k.split("_")[0]+"_"+k.split("_")[1]
            end
        end
    end
    
    
    img = {}
    img[la] = []
    img[lb] = []
    str = ""
    allf = Dir.glob('/Users/pranjal/Downloads/cohndata/**/*')
    allf = allf.select{|t| t.include?(".png")}
    val9.each do |t|
        allf.each do |p|
            if p.include?(t)
                str =  str + la.to_s+","+ p.split("/")[-1] +"\n"
            end
        end
    end
    val27.each do |t|
        allf.each do |p|
            if p.include?(t)
                str = str + lb.to_s+","+p.split("/")[-1]+"\n"
            end
        end
    end
    
    file = File.open("/Users/pranjal/Downloads/cohndata/mydataset_11_6", "w")
    file.write(str)
    file.close
    
    return str
end




def get_higher_data(str)
    
    h = {}
    sta = ""
    pq = []
    allvalues = []
    count = 0
    pr = 0
    
    str.each do |t|
        p = t.split(",")
        pa = p[1]
        r = pa.split("_")
        r = r[0]+"_"+r[1]
        
        if sta == ""
            sta = r
            pq = []
            pr = p[0]
            count = 1
            elsif sta == r
            pq << pa
            count = count+1
            else
            pr = p[0]
            mid = count/2
            pq = pq[mid..-1]
            pq.each do |q|
                allvalues << [pr, q]
            end
            count = 1
            sta = r
            pq = []
            pq << pa
        end
    end
    
    file = File.open("/Users/pranjal/Downloads/cohndata/mydataset_higher_11_6", "w")
    allvaluesa = allvalues.map{|t| t.join(",")}
    file.write(allvaluesa.join("\n"))
    file.close
    
    return allvalues
end