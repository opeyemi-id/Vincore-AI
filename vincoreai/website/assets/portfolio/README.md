# Updating the portfolio

The portfolio and case study pages build themselves from one file: `assets/portfolio/projects.json`.
To add or change a project, you edit that file and add media to a folder.

The cards on the portfolio page also exist as plain HTML in `portfolio.html`, between the `STATIC PROJECT CARDS` comments, so search engines and visitors without JavaScript can read them. Visitors with JavaScript always see what is in `projects.json`. When you add a project or change a card's text, update that HTML copy as well so the two stay in step.

## Add a new project

1. Pick a short lowercase slug with hyphens, for example `invoice-automation`. The slug becomes the web address: `/portfolio/projects/invoice-automation`.
2. Create the folder `assets/portfolio/projects/invoice-automation/` with a `screens/` folder inside it.
3. Add your media, using the names below.
4. Open `assets/portfolio/projects.json`, copy the template from the bottom of this page, and paste it into the list. Every entry except the last needs a comma after its closing `}`.
5. Fill in the fields.
6. Add a matching card to the `STATIC PROJECT CARDS` block in `portfolio.html`. Copying an existing card is the easiest way.
7. Commit and push (see below).

## Files and naming

Put everything for a project in its own folder:

```
assets/portfolio/projects/<slug>/
  cover.webp        the image on the portfolio card
  poster.jpg        the still image shown before the video plays
  demo.mp4          the demo video
  screens/
    01.webp
    02.webp
```

In `projects.json`, write file names relative to the project folder: `"coverImage": "cover.webp"`, `"screenshots": ["screens/01.webp", "screens/02.webp"]`.

## Recommended sizes and formats

| What | Format | Size |
|---|---|---|
| Cover image | WebP or JPG, 1600 x 1000 | Under 400KB |
| Screenshots | WebP or JPG, 1600 x 1000 | Under 400KB each |
| Poster image | JPG or WebP, 1600 x 900 | Under 400KB |
| Demo video | H.264 MP4, 60 to 90 seconds | Under 25MB |

Very large or long videos should not go in the repo. Upload them to YouTube, Vimeo, or Loom, then paste the link into `videoEmbedUrl` and leave `videoFile` empty. If both are set, the local video is used.

## What each field does

| Field | Meaning |
|---|---|
| `slug` | The folder name and web address. Must match the folder exactly. |
| `title` | Project name. |
| `tags` | The category shown above the title. |
| `status` | The honest label, such as `Portfolio Demonstration` or `In Development`. |
| `summary` | One or two sentences for the card and the top of the case study. |
| `stack` | Tools used. |
| `challenge` | The business problem. Shown on the card and the case study. |
| `solution` | The approach. Shown on the case study. |
| `contribution` | What you personally did. |
| `capabilities` | Bullet list for "What this covers" on the case study. |
| `flow` | The steps in the "how it works" diagram, usually four or five. |
| `coverImage`, `posterImage` | Image file names. Leave empty to show "Demo coming soon". |
| `screenshots` | List of screenshot file names. Clicking one opens a full-screen viewer. |
| `videoFile` | Local MP4 file name. |
| `videoEmbedUrl` | YouTube, Vimeo, or Loom link. |
| `liveUrl` | Full website address. The website button only appears when this is set. |
| `order` | Position on the page. Lower numbers come first. |
| `featured` | `true` gives a large card and a case study page. `false` keeps the entry in the file but hides it from the site. |

Keep it truthful: label demonstrations and unfinished work as what they are, and only list results you can back up.

## Publish your changes

Run these from the repo folder:

```
git add vincoreai/website/assets/portfolio vincoreai/website/portfolio.html
git commit -m "feat(portfolio): add invoice automation project"
git push origin main
```

Vercel publishes the site automatically after the push, usually within a minute or two.

## Empty template

```json
{
  "slug": "",
  "title": "",
  "tags": [],
  "status": "Portfolio Demonstration",
  "summary": "",
  "stack": [],
  "challenge": "",
  "solution": "",
  "contribution": "",
  "capabilities": [],
  "flow": ["Lead form", "Qualification", "CRM", "Follow-up"],
  "coverImage": "",
  "posterImage": "",
  "screenshots": [],
  "videoFile": "",
  "videoEmbedUrl": "",
  "liveUrl": "",
  "order": 10,
  "featured": true
}
```
