

    function MyCustomUploadAdapterPlugin( editor ) {
        editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
            return new UploadAdapter( loader );
        };
    }
    ClassicEditor

        .create( document.querySelector( '.editor' ), {

            extraPlugins: [ MyCustomUploadAdapterPlugin ],
            toolbar: {
                items: [
                    'heading',
                    '|',
                    'fontColor',
                    'fontSize',
                    'bold',
                    'italic',
                    'link',
                    'bulletedList',
                    'numberedList',
                    '|',
                    'indent',
                    'outdent',
                    '|',
                    'imageUpload',
                    'blockQuote',
                    'insertTable',
                    'mediaEmbed',
                    'undo',
                    'redo',
                    'codeBlock',
                    'fontBackgroundColor',
                    'highlight',
                    'horizontalLine',
                    'underline',
                    'alignment'
                ]
            },

            language: 'ko',
            image: {
                toolbar: [
                    'imageTextAlternative',
                    '|',
                    'imageStyle:alignLeft',
                    'imageStyle:full',
                    'imageStyle:alignRight'
                ],
                styles: [
                    // This option is equal to a situation where no style is applied.
                    'full',

                    // This represents an image aligned to the left.
                    'alignLeft',

                    // This represents an image aligned to the right.
                    'alignRight'
                ]
            },
            table: {
                contentToolbar: [
                    'tableColumn',
                    'tableRow',
                    'mergeTableCells',
                    'tableCellProperties',
                    'tableProperties'
                ]
            },
            licenseKey: '',
            fontSize: {
                options: [
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                    16,
                    17,
                    18,
                    19,
                    20,
                    21
                ]
            },
        }
    );
