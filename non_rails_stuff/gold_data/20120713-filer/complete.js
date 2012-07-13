    YAHOO.util.Event.onDOMReady(function() {
	YAHOO.example.ClientPagination = function() {
 
	    var formatGLink = function(elCell, oRecord, oColumn, oData) {
		elCell.innerHTML = "<a href=\"http://genomesonline.org/cgi-bin/GOLD/GOLDCards.cgi?goldstamp=" + oData + "\" target='_blank'>" + oData + "</a>";
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatLink = formatGLink;
 
	    var formatSeqStatus = function(elCell, oRecord, oColumn, oData) {
		var seqstatus = oRecord.getData("SeqStatus");
		var seqstatuslink = oRecord.getData("SeqStatusLink");
		if (seqstatuslink == '') {
		    elCell.innerHTML = seqstatus;
		} else {
		    elCell.innerHTML = "<a href=" + seqstatuslink + ">" + seqstatus + "</a>" ;
		}
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatSeqStatus = formatSeqStatus;
 
	    var formatDomain = function(elCell, oRecord, oColumn, oData) {
		if (oData == 'BACTERIAL') {
		    elCell.innerHTML = '<img src="http://www.genomesonline.org/images/B.gif">';
		} else if  (oData == 'EUKARYAL') {
		    elCell.innerHTML = '<img src="http://www.genomesonline.org/images/E.gif">';
		} else if  (oData == 'ARCHAEAL') {
		    elCell.innerHTML = '<img src="http://www.genomesonline.org/images/A.gif">';
		} else if  (oData == 'MICROBIAL') {
		    elCell.innerHTML = '<img src="http://www.genomesonline.org/images/M.png">';
		} else {
		    elCell.innerHTML =oData;
		}
            };
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatDomain = formatDomain;
 
	    var formatSize = function(elCell, oRecord, oColumn, oData) {
		var size = oRecord.getData("Size");
		var gCount = oRecord.getData("GeneCount");
		var mapLink = oRecord.getData("Maplink");
		if (gCount == '0 orfs') {
		    elCell.innerHTML = size;
		} else {
		    elCell.innerHTML = size + "<br>" + gCount;
		}
		if (mapLink == '') {
		} else {
		    elCell.innerHTML += "<br><a href=" + mapLink + ">MAP</a>" ;
		}
 
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatSize = formatSize;
 
	    var formatGCContent = function(elCell, oRecord, oColumn, oData) {
		if (oData == '') {
		    elCell.innerHTML = "" ;
		} else {
		    elCell.innerHTML = oData + "%" ;
		}
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatGCContent = formatGCContent;
 
	    var formatPublicationMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var pubData = oRecord.getData("Publications");
		for (var lineIndex=0; lineIndex < pubData.length; lineIndex++) {
		    var journal = pubData[lineIndex].Journal;
		    var link = pubData[lineIndex].Link;
		    var volume = pubData[lineIndex].Volume;
		    var year = pubData[lineIndex].Year;
		    elCell.innerHTML = "<a href=\"" + link  + "\">" + journal + ' ' + volume + "</a><br>" + year;
		}
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatPublicationMultipleLines = formatPublicationMultipleLines;
 
	    var formatContactMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var contactData = oRecord.getData("Contacts");
		for (var lineIndex=0; lineIndex < contactData.length; lineIndex++) {
		    var name = contactData[lineIndex].Name;
		    var url = contactData[lineIndex].Link;
		    var email = contactData[lineIndex].Email;
		    if (email != '') {
			elCell.innerHTML = "<a title =" + name + " href=\"mailto://" + email + "\">" + name + "</a><br>";
		    } else if (url != '') {
			elCell.innerHTML = "<a title =" + name + " href=\"" + url  + "\">" +  name + "</a><br>";
		    } else {
			elCell.innerHTML = name + "<br>";
		    }
		}
            };
 
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatContactMultipleLines = formatContactMultipleLines;
 
	    var formatInfoMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var infoData = oRecord.getData("Information");
		var phylogeny = oRecord.getData("Phylogeny");
		var gpid = oRecord.getData("GPID");
		var taxid = oRecord.getData("TaxonID");
		if (phylogeny != '') {
		    elCell.innerHTML =  phylogeny + "<br>" ;
		}
		if (taxid != '') {
		    elCell.innerHTML +=  "<a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=" + taxid + "\">Taxonomy</a><br>";
		}
		if (gpid != '') {
		    elCell.innerHTML +=  "<a href=\"http://www.ncbi.nlm.nih.gov/sites/entrez?db=genomeprj&cmd=Retrieve&dopt=Overview&list_uids=" + gpid + "\">Entrez</a><br>";
		}
 
		for (var lineIndex=0; lineIndex < infoData.length; lineIndex++) {
		    var name = infoData[lineIndex].Name;
		    var link = infoData[lineIndex].Link;
		    elCell.innerHTML +=  link + name + "</a><br>";
		}
	    };
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatInfoMultipleLines = formatInfoMultipleLines;
 
	    var formatGenomeDatabaseMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var genomeDatabaseData = oRecord.getData("GenomeDatabase");
		for (var lineIndex=0; lineIndex < genomeDatabaseData.length; lineIndex++) {
		    var name = genomeDatabaseData[lineIndex].Name;
		    var link = genomeDatabaseData[lineIndex].Link;
		    elCell.innerHTML +=  link + name + "</a><br>";
		}
	    };
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatGenomeDatabaseMultipleLines = formatGenomeDatabaseMultipleLines;
 
	    var formatSeqCentersMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var seqCentersData = oRecord.getData("SequencingCenters");
		for (var lineIndex=0; lineIndex < seqCentersData.length; lineIndex++) {
		    var name = seqCentersData[lineIndex].Name;
		    var link = seqCentersData[lineIndex].Link;
		    elCell.innerHTML +=  link + name + "</a><br>";
		}
		seqCentersData = oRecord.getData("Collaborators");
		for (var lineIndex=0; lineIndex < seqCentersData.length; lineIndex++) {
		    var name = seqCentersData[lineIndex].Name;
		    var link = seqCentersData[lineIndex].Link;
		    elCell.innerHTML +=  link + name + "</a><br>";
		}
	    };
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatSeqCentersMultipleLines = formatSeqCentersMultipleLines;
 
	    var formatDataSearchMultipleLines = function(elCell, oRecord, oColumn, oData) {
		var dataSearchData = oRecord.getData("DataSearch");
		for (var lineIndex=0; lineIndex < dataSearchData.length; lineIndex++) {
		    var name = dataSearchData[lineIndex].Name;
		    var link = dataSearchData[lineIndex].Link;
		    elCell.innerHTML +=  link + name + "</a><br>";
		}
	    };
 // Add the custom formatter to the shortcuts
            YAHOO.widget.DataTable.Formatter.myFormatDataSearchMultipleLines = formatDataSearchMultipleLines;
 
 
	    function sortDates(a, b, desc, field)
	    {
		if (a == null) {
		    return -1; 
		} 
		var comp = YAHOO.util.Sort.compare; 
		var pub1 = a.getData("Publications");
		var pub2 = b.getData("Publications");
		var date1 =pub1[0].Year;
		var date2 = pub2[0].Year;
		var compDate = comp(date1, date2, desc); 
		return compDate;
	    }
 
	    var myDataSource = new YAHOO.util.DataSource("/json/complete.json?");
	    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
 
	    myDataSource.responseSchema = {    
		resultsList: "records",
		fields: [
		    {key:"Goldstamp"},
		    {key:"Organism"},
		    {key:"Domain"},
		    {key:"Phylogeny"},
		    {key:"GPID"},
		    {key:"TaxonID"},
		    {key:"Information"},
		    {key:"Size"},
		    {key:"Chromosomes"},
		    {key:"Plasmids"},
		    {key:"GCContent"},
		    {key:"GeneCount"},
		    {key:"Maplink"},
		    {key:"DataSearch"},
		    {key:"SequencingCenters"},
		    {key:"Collaborators"},
		    {key:"GenomeDatabase"},
		    {key:"Publications"},
		    {key:"CompletionDate"},
		    {key:"Contacts"}
		],
	    };
 
var myColumnDefs = [
    {key:"Goldstamp", label: "GOLD ID", sortable:true, resizeable:true, formatter:"myFormatLink"},
    {key:"Organism", label: "ORGANISM", sortable:true, resizeable:true},
    {key:"Domain", label: "DOMAIN", sortable:true, resizeable:true, formatter:"myFormatDomain", className:"align-center"},
    {key:"Information", label: "INFORMATION", sortable:true, resizeable:true, formatter:"myFormatInfoMultipleLines", className:"align-center"},
    {key:"Size", label: "SIZE", sortable:true, resizeable:true, formatter:"myFormatSize", className:"align-center"},
    {key:"Chromosomes", label: "CHROM #", sortable:true, resizeable:true, className:"align-center"},
    {key:"Plasmids", label: "PLASM #", sortable:true, resizeable:true, className:"align-center"},
    {key:"GCContent", label: "GC %", sortable:true, resizeable:true, formatter:"myFormatGCContent", className:"align-center"},
    {key:"DataSearch", label: "DATA", sortable:true, resizeable:true, formatter:"myFormatDataSearchMultipleLines", className:"align-center"},
    {key:"SequencingCenters", label: "SEQUENCING CENTER", sortable:true, resizeable:true, formatter:"myFormatSeqCentersMultipleLines", className:"align-center"},
    {key:"GenomeDatabase", label: "GENOME DATABASE", sortable:true, resizeable:true, formatter:"myFormatGenomeDatabaseMultipleLines", className:"align-center"},
    {key:"Publications", label: "PUBLICATION", sortable:true, resizeable:true, formatter:"myFormatPublicationMultipleLines", className:"align-center"},
    {key:"CompletionDate", label: "COMPLETION DATE", sortable:true, resizeable:true, className:"align-center"},
    {key:"Contacts", label: "CONTACT", sortable:true, resizeable:true,  formatter:"myFormatContactMultipleLines", className:"align-center"}
];
 
	    var myConfig = {
		paginator: new YAHOO.widget.Paginator({
                    rowsPerPage: 100,
                    template: YAHOO.widget.Paginator.TEMPLATE_ROWS_PER_PAGE,
		    rowsPerPageOptions: [{value:10, text:"10"}, 
					 {value:25, text:"25"}, 
					 {value:50, text:"50"}, 
					 {value:100, text:"100"}, 
					 {value:1000, text:"1000"}, 
					 {value:"all", text:"All"} ],
		    pageLinks: 5
		}),
		draggableColumns:true
            };
 
 
	    var myDataTable = new YAHOO.widget.DataTable("myContainer", myColumnDefs, myDataSource, myConfig);
 
 
	    return {
		oDS: myDataSource,
		oDT: myDataTable
            };
	}();
    });
