import chalk from 'chalk';
import boxen from 'boxen';
import { Command } from 'commander';

const program = new Command();


program
  .name('onePiece-plymouth')
  .description('CLI to install onePiece-plymouth')
  .version('0.0.');

program
  .option('--fast', 'fast animation')
  .option('--slow', 'slow animation')

program.parse();

if (program.opts().fast) {
    console.log('install fast animation')
}
else if(program.opts().slow) {
    console.log('install slow animation')
}
else {
    console.log('run npx onePiece-plymouth --help')
}

