/* eslint-disable @typescript-eslint/no-var-requires */
/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable import/no-extraneous-dependencies */
const fs = require('fs')
const glob = require('glob')
const path = require('path')

function rename() {
  const files = glob.sync(path.join(process.cwd(), 'src', '**', '*.ts'))

  files.map((fn: any) => {
    const filename = fn.split('/').pop()

    if (!filename || filename === 'index.ts') {
      return
    }

    const find = 'a'
    const replace = 'b'

    if (filename.includes(find)) {
      const fn1 = fn.replace(find, replace)
      fs.renameSync(fn, fn1)
    }

    return
  })
}

rename()
