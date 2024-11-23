workflow {
    def trace_timestamp = new java.util.Date().format( 'yyyy-MM-dd_HH-mm-ss')

    ch_stable_content = Channel.of(
    """
    I HAVE STABLE CONTENT
    """.stripIndent().trim())
    .collectFile(storeDir: "${params.outdir}/stable", name: 'stable_content.txt', sort: true, newLine: true)

    ch_stable_name = Channel.of(
    """
    I DO NOT HAVE STABLE CONTENT
    ${trace_timestamp}
    """.stripIndent().trim())
    .collectFile(storeDir: "${params.outdir}/stable", name: 'stable_name.txt', sort: true, newLine: true)

    ch_unstable_name = Channel.of(
    """
    I DO NOT HAVE STABLE NAME
    """.stripIndent().trim())
    .collectFile(storeDir: "${params.outdir}/pipeline_info", name: "execution_trace_${trace_timestamp}.txt", sort: true, newLine: true)

    ch_subdirectory = Channel.of(
    """
    I AM IN A SUBDIRECTORY OF STABLE
    """.stripIndent().trim())
    .collectFile(storeDir: "${params.outdir}/stable/subdirectory", name: "subdir_file.txt", sort: true, newLine: true)

    ch_zip = Channel.of(
    """
    I AM A ZIP FILE
    """.stripIndent().trim())
    .collectFile(storeDir: "${params.outdir}/stable/subdirectory", name: "file.zip", sort: true, newLine: true)
}
