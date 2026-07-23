/**
 * Vincore AI — TEMPLATE: Proposal Build Script
 * ─────────────────────────────────────────────
 * HOW TO USE:
 *   1. Edit client_config.json for the new client
 *   2. Run:  node build_proposal_template.js
 *   3. Output file appears in ./output/
 *
 * This script is the reference template for all Word (.docx) build scripts.
 * The pattern is identical across all 22 Word documents:
 *   - C.CLIENT, C.CODE, C.NAME etc. replace every hardcoded MBH value
 *   - C.logo() returns the client logo buffer
 *   - C.filename() builds the output filename
 */

const docx = require('docx');
const fs   = require('fs');
const path = require('path');
const C    = require('./config_loader');   // ← the only import change needed

const {
  Document, Packer, Paragraph, TextRun, HeadingLevel,
  AlignmentType, Table, TableRow, TableCell, WidthType,
  ShadingType, ImageRun, BorderStyle, Header, Footer,
  convertInchesToTwip, PageBreak
} = docx;

// ── COLORS (unchanged across all clients) ────────────────────────
const NAVY='081C3A', BLUE='2196F3', CYAN='54E0FF', WHITE='FFFFFF';
const BODY='37415f', MUTED='6b7794', PAPER='F2F9FF', SILVER='C8D3E6';
const GREEN='10B981', AMBER='D97706', RED='EF4444';

const TW = n => convertInchesToTwip(n);
const TEXT_W = TW(6.27);

const NB = {top:{style:BorderStyle.NONE,size:0,color:WHITE},bottom:{style:BorderStyle.NONE,size:0,color:WHITE},left:{style:BorderStyle.NONE,size:0,color:WHITE},right:{style:BorderStyle.NONE,size:0,color:WHITE},insideHorizontal:{style:BorderStyle.NONE,size:0,color:WHITE},insideVertical:{style:BorderStyle.NONE,size:0,color:WHITE}};
const TB = (col=SILVER) => ({top:{style:BorderStyle.SINGLE,size:4,color:col},bottom:{style:BorderStyle.SINGLE,size:4,color:col},left:{style:BorderStyle.SINGLE,size:4,color:col},right:{style:BorderStyle.SINGLE,size:4,color:col},insideHorizontal:{style:BorderStyle.SINGLE,size:4,color:col},insideVertical:{style:BorderStyle.SINGLE,size:4,color:col}});

const run = (text, opts={}) => new TextRun({text, font:'Arial', size:opts.size||20, bold:opts.bold||false, color:opts.color||BODY, italics:opts.italic||false});
const para = (children, opts={}) => new Paragraph({children:Array.isArray(children)?children:[children], alignment:opts.align||AlignmentType.LEFT, spacing:{before:opts.spaceBefore!==undefined?opts.spaceBefore:100, after:opts.spaceAfter!==undefined?opts.spaceAfter:100, line:280}, heading:opts.heading||undefined});
const blank = (h=160) => new Paragraph({children:[new TextRun('')], spacing:{before:h,after:0}});
const pb = () => new Paragraph({children:[new PageBreak()], spacing:{before:0,after:0}});
const cellN = (children, opts={}) => new TableCell({children:Array.isArray(children)?children:[children], shading:opts.bg?{type:ShadingType.CLEAR,fill:opts.bg,color:opts.bg}:undefined, width:opts.width?{size:opts.width,type:WidthType.DXA}:undefined, borders:opts.borders||NB, margins:opts.margins||{top:80,bottom:80,left:120,right:120}, verticalAlign:opts.vAlign||'center', columnSpan:opts.span});

// ── LOAD CLIENT LOGO ──────────────────────────────────────────────
const clientLogo = C.logo();

// ── ENSURE OUTPUT DIRECTORY EXISTS ────────────────────────────────
if (!fs.existsSync(C.OUT)) fs.mkdirSync(C.OUT, {recursive:true});

// ── COVER PAGE ────────────────────────────────────────────────────
// NOTE: All text values now use C.CLIENT, C.CODE, C.NAME etc.
// Replace the MBH-specific content below with generic client placeholders.
const coverPage = [

  // Header band
  new Table({
    width:{size:TEXT_W,type:WidthType.DXA}, columnWidths:[TEXT_W], borders:NB,
    rows:[new TableRow({height:{value:TW(0.8),rule:'exact'}, children:[cellN([
      para([run('VINCORE AI',{size:32,bold:true,color:CYAN}), run(`    |    ${C.vincore.tagline}`,{size:20,color:'C8D3E6'})],{spaceBefore:160,spaceAfter:160})
    ],{bg:NAVY,width:TEXT_W,margins:{top:120,bottom:120,left:200,right:200}})]})]
  }),

  blank(400),

  // ── CUSTOMISE BELOW: replace hard-coded content with C.* references ──
  para([run('PROPOSAL',{size:52,bold:true,color:NAVY})],{spaceBefore:0,spaceAfter:80}),
  new Paragraph({children:[new TextRun('')], border:{bottom:{style:BorderStyle.SINGLE,size:12,color:BLUE,space:2}}, spacing:{before:0,after:240}}),

  // Project name — from config
  para([run(C.NAME,{size:24,bold:true,color:BODY})],{spaceBefore:0,spaceAfter:200}),

  blank(80),

  // Client details — all from config
  para([run('Prepared for  ',{size:22,bold:true,color:MUTED}), run(C.CLIENT,{size:22,bold:true,color:NAVY})],{spaceBefore:0,spaceAfter:80}),
  para([run('Prepared by  ',{size:22,bold:true,color:MUTED}), run(`${C.vincore.founder}, ${C.vincore.company}`,{size:22,color:BODY})],{spaceBefore:0,spaceAfter:80}),
  para([run('Document ID  ',{size:22,bold:true,color:MUTED}), run(C.docs.prop,{size:22,color:BODY})],{spaceBefore:0,spaceAfter:80}),

  blank(300),

  // Client logo (if available)
  ...(clientLogo ? [
    new Paragraph({children:[new ImageRun({data:clientLogo,transformation:{width:80,height:80},type:'jpeg'})], alignment:AlignmentType.LEFT, spacing:{before:0,after:200}}),
  ] : [blank(200)]),

  blank(300),

  // Version / date footer strip
  new Table({
    width:{size:TEXT_W,type:WidthType.DXA}, columnWidths:[TEXT_W/3,TEXT_W/3,TEXT_W/3], borders:NB,
    rows:[new TableRow({children:[
      cellN([para([run('VERSION',{size:15,bold:true,color:MUTED})],{spaceBefore:40,spaceAfter:20}), para([run(C.VERSION,{size:20,bold:true,color:NAVY})],{spaceBefore:0,spaceAfter:40})],{width:TEXT_W/3,borders:{...NB,right:{style:BorderStyle.SINGLE,size:4,color:SILVER}}}),
      cellN([para([run('DATE',{size:15,bold:true,color:MUTED})],{spaceBefore:40,spaceAfter:20,align:AlignmentType.CENTER}), para([run(C.MONTH,{size:20,bold:true,color:NAVY})],{spaceBefore:0,spaceAfter:40,align:AlignmentType.CENTER})],{width:TEXT_W/3,borders:{...NB,right:{style:BorderStyle.SINGLE,size:4,color:SILVER}}}),
      cellN([para([run('STATUS',{size:15,bold:true,color:MUTED})],{spaceBefore:40,spaceAfter:20,align:AlignmentType.RIGHT}), para([run('Draft',{size:20,bold:true,color:AMBER})],{spaceBefore:0,spaceAfter:40,align:AlignmentType.RIGHT})],{width:TEXT_W/3}),
    ]})]
  }),

  pb(),
];

// ── DOCUMENT BODY TEMPLATE ────────────────────────────────────────
// Replicate your original proposal sections here, substituting:
//   'My Beauty Haven'                 → C.CLIENT
//   'Onyinye Obiozor'                 → C.CONTACT
//   'VAI-CLI-MBH-001'                 → C.CODE
//   'Booking Automation & CRM...'     → C.NAME
//   '₦500,000'                        → C.FEE
//   '₦250,000' (deposit)              → C.DEPOSIT
//   '₦250,000' (balance)              → C.BALANCE
//   'opeyemi@vincoreai.com'            → C.vincore.email
//   'vincoreai.com'                    → C.vincore.website
//   'Yaba, Lagos, Nigeria'             → C.LOCATION
//   'mybeautyhaven@gmail.com'          → C.EMAIL
//   'June 2026'                        → C.MONTH
// See TEMPLATE_SUBSTITUTIONS.md for the full list.
const bodyPages = [
  para([run('Introduction',{size:26,bold:true,color:NAVY})],{spaceBefore:0,spaceAfter:160}),
  para([run(`${C.vincore.company} is pleased to present this proposal to ${C.CLIENT}.`,{size:20,color:BODY})],{spaceBefore:0,spaceAfter:160}),

  // ADD ALL REMAINING PROPOSAL SECTIONS HERE using C.* for all client values
  // Copy from build_proposal.js (the MBH version) and substitute values as above
];

// ── HEADERS & FOOTERS ─────────────────────────────────────────────
const bodyHeader = new Header({children:[new Table({
  width:{size:TEXT_W,type:WidthType.DXA}, columnWidths:[TEXT_W/2,TEXT_W/2],
  borders:{...NB,bottom:{style:BorderStyle.SINGLE,size:4,color:SILVER}},
  rows:[new TableRow({children:[
    cellN([para([run(`VINCORE AI  |  Confidential`,{size:16,bold:true,color:NAVY})],{spaceBefore:40,spaceAfter:40})],{width:TEXT_W/2,borders:NB}),
    cellN([para([run(`${C.CODE}  |  Proposal`,{size:16,color:MUTED})],{spaceBefore:40,spaceAfter:40,align:AlignmentType.RIGHT})],{width:TEXT_W/2,borders:NB}),
  ]})]
})]});

const bodyFooter = new Footer({children:[new Table({
  width:{size:TEXT_W,type:WidthType.DXA}, columnWidths:[TEXT_W/2,TEXT_W/2],
  borders:{...NB,top:{style:BorderStyle.SINGLE,size:4,color:SILVER}},
  rows:[new TableRow({children:[
    cellN([para([run(`${C.CLIENT}  |  ${C.NAME}`,{size:16,color:MUTED})],{spaceBefore:40,spaceAfter:40})],{width:TEXT_W/2,borders:NB}),
    cellN([new Paragraph({children:[new TextRun({text:'Page ',size:16,color:MUTED,font:'Arial'}), new TextRun({children:[docx.PageNumber.CURRENT],size:16,color:MUTED,font:'Arial'})],alignment:AlignmentType.RIGHT,spacing:{before:40,after:40}})],{width:TEXT_W/2,borders:NB}),
  ]})]
})]});

// ── BUILD AND WRITE ───────────────────────────────────────────────
const doc = new Document({
  sections:[{
    properties:{page:{margin:{top:TW(1),bottom:TW(1),left:TW(1),right:TW(1)},size:{width:11906,height:16838}}},
    headers:{default:bodyHeader}, footers:{default:bodyFooter},
    children:[...coverPage, ...bodyPages],
  }],
});

const outFile = path.join(C.OUT, C.filename('prop', 'docx', 'Proposal'));

Packer.toBuffer(doc).then(buf => {
  fs.writeFileSync(outFile, buf);
  console.log(`✓  Built: ${outFile}`);
}).catch(err => {
  console.error('Build failed:', err.message);
  process.exit(1);
});
