# ──────────────────────────────────────────────
# Syed Ghani — Portfolio API seed data
# Mirrors personal_portfolio/src/utils/resumeData.js exactly
# ──────────────────────────────────────────────

puts "Seeding #{Rails.env} database …"

# ══════════════════════════════════════════════
# Admin User
# ══════════════════════════════════════════════
user = User.find_or_create_by!(email: "syedghani001@gmail.com") do |u|
  u.password = ENV.fetch("ADMIN_PASSWORD", "changeme123")
  u.jti = SecureRandom.uuid
end

# ══════════════════════════════════════════════
# Profile
# ══════════════════════════════════════════════
profile = Profile.find_or_initialize_by(user: user)
profile.update!(
  name: "Syed Ghani",
  headline: "Software Engineer, Ruby on Rails Developer, React.js Developer, Full Stack Engineer, API Specialist, Problem Solver",
  tagline: "Full-Stack Engineer · Ruby on Rails & React",
  bio: "Software engineer focused on Ruby on Rails and React. I design and ship end-to-end features for SaaS products — REST APIs, data modeling, background jobs, and accessible front ends — in agile teams where reliability and pace both matter. Recent work spans AI-enabled PRM, college recruiting marketplaces, K–12 coaching platforms, and fintech-style billing services.",
  about_extra: "I care about clear boundaries between domains, tests that earn their keep (RSpec), and integrations that survive real traffic. Comfortable owning a slice of the stack from migration to deploy.",
  hero_bullets: [
    "Rails APIs, PostgreSQL, and background work with Sidekiq / Redis",
    "React SPAs: auth flows, dashboards, and integration-heavy UIs",
    "Third-party systems: Stripe, HubSpot, Moodle, Documenso, webhooks",
  ],
  location: "Lahore, Pakistan",
  phone: "+92 309 0204019",
  contact_email: "syedghani001@gmail.com",
  website: "https://sghani001.github.io/personal_portfolio/",
  leetcode_url: "https://leetcode.com/syedghani/",
  avatar_url: "https://avatars.githubusercontent.com/sghani001",
  available_for_hire: true,
  social_links: {
    linkedin: "https://www.linkedin.com/in/syed-m-ghani-357ba4234",
    github: "https://github.com/sghani001",
    email: "mailto:syedghani001@gmail.com"
  },
  skills: [
    { name: "Ruby on Rails", category: "Backend", proficiency: 90 },
    { name: "React.js", category: "Frontend", proficiency: 80 },
    { name: "JavaScript (ES6+)", category: "Frontend", proficiency: 80 },
    { name: "REST APIs", category: "Backend", proficiency: 90 },
    { name: "PostgreSQL", category: "Database", proficiency: 85 },
    { name: "MySQL", category: "Database", proficiency: 70 },
    { name: "Redis", category: "Database", proficiency: 75 },
    { name: "Sidekiq", category: "Backend", proficiency: 75 },
    { name: "Stripe", category: "Integrations", proficiency: 75 },
    { name: "HubSpot", category: "Integrations", proficiency: 70 },
    { name: "Tailwind CSS", category: "Frontend", proficiency: 80 },
    { name: "RSpec", category: "Testing", proficiency: 80 },
    { name: "Node.js", category: "Backend", proficiency: 50 },
    { name: "Docker", category: "DevOps", proficiency: 50 },
    { name: "Git", category: "DevOps", proficiency: 85 },
    { name: "Linux", category: "DevOps", proficiency: 75 },
    { name: "Python", category: "Backend", proficiency: 50 },
    { name: "Documenso", category: "Integrations", proficiency: 75 },
    { name: "Moodle", category: "Integrations", proficiency: 70 },
    { name: "Heroku", category: "DevOps", proficiency: 75 },
  ]
)

# ══════════════════════════════════════════════
# Projects
# ══════════════════════════════════════════════
projects = [
  {
    title: "CinnaLab",
    description: "AI-assisted Partner Relationship Management platform built at Blackstack. Designed and shipped partner onboarding, deal registration, training paths, and e-signature workflows with two-way sync to HubSpot CRM and Moodle LMS. Documenso integrated for agreements. Deployed on Heroku.",
    url: "https://cinnalab.io/",
    github_url: "https://cinnalab.io/",
    tech_stack: ["React.js", "Ruby on Rails", "HubSpot API", "Moodle", "Documenso", "Redis", "Sidekiq", "Heroku"],
    images: ["https://images.unsplash.com/photo-1551434678-e076c223a692?w=600&h=380&fit=crop"],
    featured: true,
    position: 1,
    problem: "Partner programs lived across HubSpot, Moodle, and documents — high drop-off, duplicate data, and fragile manual handoffs between sales and enablement.",
    solution: "Built CinnaLab as the operational hub: guided onboarding, deal registration, and training paths with two-way sync to HubSpot and Moodle plus Documenso for agreements.",
    metrics: [
      "Cut onboarding cycle time materially through guided flows and automation",
      "Standardized e-signature and document paths via Documenso",
      "Reduced manual re-entry between CRM and LMS via resilient webhooks",
    ],
    engineering: [
      "Webhook-driven sync with retries, idempotency-minded handlers, and clear audit trails",
      "JWT-based session model alongside secure server-side checks",
      "Sidekiq queues for imports, exports, and long-running partner operations",
      "Strict API contracts and validation at Rails boundaries",
    ],
  },
  {
    title: "Intercollegiate",
    description: "National job board for college athletics serving DI/DII/DIII programs, built at Blackstack. Features multi-parameter search across sport, division, conference, compensation, and role level with sub-200ms response times via PostgreSQL indexing and scoped ActiveRecord patterns. Handles 2,500+ concurrent listings with steady daily traffic from athletic departments and applicants.",
    url: "https://intercollegiate.co/",
    github_url: "https://intercollegiate.co/",
    tech_stack: ["Ruby on Rails", "PostgreSQL", "JavaScript", "Performance Tuning"],
    images: ["https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600&h=380&fit=crop"],
    featured: true,
    position: 2,
    problem: "Recruiters and candidates needed fast, trustworthy search across sport, division, conference, compensation, and role level without painful load times.",
    solution: "Implemented indexed, composable querying and a Rails-centric architecture that keeps filters snappy as listing volume grows.",
    metrics: [
      "2,500+ concurrent listings with responsive filter UX",
      "Tuned multi-parameter search into sub-200ms paths on representative workloads",
      "Served steady daily traffic from athletic departments and applicants",
    ],
    engineering: [
      "PostgreSQL indexing and scoped ActiveRecord patterns for heavy filter combinations",
      "Presenter-style view layer to keep complex search readable",
      "Performance passes on N+1 hotspots and hot query paths",
    ],
  },
  {
    title: "Bullseye",
    description: "K–12 instructional coaching platform built at Blackstack, enabling walkthroughs, in-the-moment feedback via web and mobile signals, and actionable analytics for school leaders and district administrators. Feature work spanned Rails services and React components with role-aware permissions.",
    url: "https://bullseye.education/",
    github_url: "https://bullseye.education/",
    tech_stack: ["Ruby on Rails", "React.js", "PostgreSQL"],
    images: ["https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=600&h=380&fit=crop"],
    featured: true,
    position: 3,
    problem: "Districts needed consistent coaching workflows and visibility into classroom support — not one-off spreadsheets or ad hoc tools.",
    solution: "Contributed features across coaching workflows, feedback capture, and reporting surfaces used by principals and district leads.",
    metrics: [
      "Shipped iterative improvements alongside product and instructional design",
      "Hardened flows used in live districts during the school year",
    ],
    engineering: [
      "Feature work spanning Rails services and React client components",
      "Collaboration on permissions and role-aware views for staff vs leaders",
    ],
  },
  {
    title: "Docyt",
    description: "AI-assisted bookkeeping microservice handling payments and subscriptions, built at Blackstack. Designed and implemented Stripe-facing service with billing cycles, webhook reconciliation, and operational logging. Extracted from monolith billing paths into a focused service with clear REST contracts.",
    url: "https://docyt.com/",
    github_url: "https://docyt.com/",
    tech_stack: ["Ruby on Rails", "Stripe", "Microservices", "Webhooks"],
    images: ["https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=600&h=380&fit=crop"],
    featured: true,
    position: 4,
    problem: "Subscription and invoicing logic needed to live in a dedicated service with reliable Stripe webhooks and clear reconciliation.",
    solution: "Designed and implemented the Stripe-facing microservice: plans, billing cycles, webhooks, and handoff to core Docyt services.",
    metrics: [
      "Production-ready Stripe flows for hospitality and accounting lines",
      "Webhook handling with operational logging for finance teams",
    ],
    engineering: [
      "Service extraction from monolith billing paths",
      "Idempotent webhook processing and defensive error handling",
      "REST contracts between payment service and platform core",
    ],
  },
  {
    title: "Monthend / Controllr",
    description: "SaaS platform for month-end close and financial controls, built at Blackstack. Built authentication (email + Google OAuth 2.0), multi-step onboarding flows, and workflow management surfaces for finance teams using Devise, Stimulus, and Turbo. Managed small engineering team on this project.",
    url: "https://fly.controllr.app/",
    github_url: "https://fly.controllr.app/",
    tech_stack: ["Ruby on Rails", "Hotwire", "Stimulus.js", "Turbo", "OAuth", "PostgreSQL", "Devise"],
    images: ["https://images.unsplash.com/photo-1542744094-3a31f272c490?w=600&h=380&fit=crop"],
    featured: true,
    position: 5,
    problem: "Finance teams lacked a single place to run close tasks with clear ownership and audit-friendly history.",
    solution: "Built authentication (email + Google OAuth), onboarding, and product surfaces that support recurring close and control tasks.",
    metrics: [
      "Delivered OAuth and email auth end-to-end with session hygiene",
      "Reduced friction in first-run setup for new orgs",
    ],
    engineering: [
      "Devise + Google OAuth 2.0 with careful callback and token refresh handling",
      "Multi-step onboarding flows with reactive Stimulus controllers and Turbo frames",
      "Turbo-powered updates and checklist interactions for a real-time SPA feel",
    ],
  },
  {
    title: "rails-guarddog",
    description: "A security scanner purpose-built for Rails applications, designed to complement Brakeman by covering the vulnerability classes it misses — including AI/LLM prompt injection, denial-of-service and ReDoS patterns, supply-chain typosquatting, and IDOR gaps. Ships with twelve dedicated security checkers, each mapped to the relevant CWE and OWASP category, and outputs console, HTML, or JSON reports suitable for CI/CD pipelines.",
    url: "https://github.com/sghani001/rails-guarddog",
    github_url: "https://github.com/sghani001/rails-guarddog",
    tech_stack: ["Ruby", "Security", "AST Analysis", "Brakeman", "CWE", "OWASP"],
    images: ["https://images.unsplash.com/photo-1581092334490-2f9c7e8e1e9c?w=600&h=380&fit=crop"],
    featured: true,
    position: 7,
    problem: "Brakeman remains the standard Rails security scanner, but it does not cover several modern risk categories — AI/LLM prompt injection, ReDoS, dependency typosquatting, and field-level GraphQL authorization gaps — leaving teams with a false sense of complete coverage.",
    solution: "Built a companion static-analysis tool with twelve purpose-built checkers spanning authentication, injection, data protection, and resource-management concerns, each traceable to a specific CWE/OWASP category, with CI-friendly output formats and exit codes.",
    metrics: [
      "Twelve dedicated security checkers, each mapped to a CWE and OWASP classification",
      "Covers vulnerability classes absent from Brakeman's default rule set, including LLM prompt injection, ReDoS, and dependency typosquatting detection via Levenshtein distance",
      "Directly fixes two documented Brakeman gaps: permit! mass-assignment detection and hardcoded-secret detection",
      "Lightweight footprint — roughly 2,000 lines of code with only two runtime dependencies (parser, ast)",
    ],
    engineering: [
      "AST-based static analysis (rather than regex matching) using the parser and ast gems to walk and reason about Ruby source safely",
      "Configurable checker set and severity-based CI failure thresholds via a Rails initializer",
      "Rake-task driven design (guarddog:scan, guarddog:report, guarddog:ci) so scans run out-of-band in CI rather than as production middleware",
      "Three structured report formats — console, HTML, and JSON — for both local review and automated pipelines",
    ],
  },
  {
    title: "rails-persona",
    description: "A model-level behavioral analytics engine for Rails that tracks what users do, not just which pages they view. Works on any ActiveRecord model, integrates natively with Sidekiq for background processing, and ships with zero external service dependencies.",
    url: "https://github.com/sghani001/rails-persona",
    github_url: "https://github.com/sghani001/rails-persona",
    tech_stack: ["Ruby", "Rails Engine", "Sidekiq", "Analytics"],
    images: ["https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=600&h=380&fit=crop"],
    featured: true,
    position: 8,
    problem: "Page-view analytics tools like Ahoy answer where users go, but not what they actually do inside the application — the action-level signal product and growth teams need to diagnose onboarding friction and drop-off.",
    solution: "Built a lightweight, model-level behavior tracker that attaches to any ActiveRecord model, records declared or ad hoc actions, and surfaces class-level analytics such as leaderboards and action breakdowns without wiring in an external analytics vendor.",
    metrics: [
      "Tracks behavior at the model level rather than the page level — works on any ActiveRecord model, not only User",
      "Ships built-in class-level analytics out of the box, including per-model leaderboards and application-wide action summaries",
      "Zero external services or client-side JavaScript snippets required to operate",
    ],
    engineering: [
      "bulk_track! uses insert_all! to avoid N+1 writes and per-row callback overhead when recording high-volume events",
      "Optional async mode dispatches through Sidekiq when configured, with automatic fallback to synchronous writes if Sidekiq is unavailable",
      "Built-in retention control via Persona::Pruner.prune_older_than, intended to run as a scheduled Rake task",
      "Optional open-tracking mode allows recording ad hoc event names outside a predeclared action whitelist",
    ],
  },
  {
    title: "rails-tenantify",
    description: "A lightweight, row-level multi-tenancy library for modern Rails applications (Rails 7+, Ruby 3.1+), built around explicit tenant scoping and safe defaults that prevent accidental cross-tenant data access.",
    url: "https://github.com/sghani001/rails-tenantify",
    github_url: "https://github.com/sghani001/rails-tenantify",
    tech_stack: ["Ruby on Rails", "SaaS Architecture", "Multi-tenancy"],
    images: ["https://images.unsplash.com/photo-1508830524289-0adcbe822b40?w=600&h=380&fit=crop"],
    featured: true,
    position: 9,
    problem: "Multi-tenant SaaS applications carry a costly failure mode: an unscoped bulk operation — update_all, delete_all, destroy_all — can silently touch rows across every tenant, and most multi-tenancy gems are heavier than a typical Rails 7 app actually needs.",
    solution: "Built a lean, dependency-light multi-tenancy layer with an explicit belongs_to_tenant macro, pluggable tenant resolution, and hard guardrails around bulk write operations, along with first-class support for propagating tenant context into background jobs.",
    metrics: [
      "Targets modern Rails (7+) and Ruby (3.1+) with no deprecated APIs",
      "Bulk write operations (update_all, delete_all, destroy_all) raise Tenantify::TenantMismatchError by default unless explicitly bypassed, closing off the most common cross-tenant data leak",
    ],
    engineering: [
      "belongs_to_tenant macro auto-assigns the tenant foreign key on create and enforces its immutability afterward",
      "Tenant resolution is pluggable at the controller layer via subdomain, header, or a custom resolver class implementing #call(request)",
      "Background-job tenant propagation supports Sidekiq, GoodJob, Solid Queue, and generic ActiveJob, serializing the tenant ID into the job payload and restoring it on execution; a dedicated Tenantify::Middleware::Sidekiq handles native (non-ActiveJob) Sidekiq workers",
      "Ships RSpec and Minitest test helpers (with_tenant, without_tenant) for scoping tenant context in specs",
    ],
  },
  {
    title: "rails-css_unused",
    description: "A static-analysis tool that scans Rails views, templates, and view components to find CSS classes that are declared in stylesheets but never referenced — a maintained, server-free alternative to the long-abandoned deadweight gem.",
    url: "https://github.com/sghani001/rails-css_unused",
    github_url: "https://github.com/sghani001/rails-css_unused",
    tech_stack: ["Ruby", "Static Analysis", "Asset Pipeline"],
    images: ["https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&h=380&fit=crop"],
    featured: true,
    position: 10,
    problem: "Legacy Rails codebases accumulate dead CSS over time, and the previous standard tool for finding it (deadweight) is unmaintained and requires a running server to crawl pages; static analysis needed to also handle dynamically constructed class names without flooding results with false positives.",
    solution: "Built a static scanner covering ERB, HAML, Slim, ViewComponent, Phlex, and Stimulus JS class detection in a single pass, with a v0.2.1 release adding smart detection of dynamically constructed CSS class variables to eliminate a real class of false positives.",
    metrics: [
      "Maintained, server-free replacement for the abandoned deadweight gem — no running application required to scan",
      "Single scanner covers ERB, HAML, Slim, ViewComponent, Phlex templates, and Stimulus JS class references",
      "v0.2.1's dynamic class-variable detection removes false positives from patterns like status_class = \"status-cancelled\" that previously required manual ignore_patterns regex workarounds",
    ],
    engineering: [
      "Two targeted heuristics introduced in v0.2.1: variables named *_class(es)/*_style/*_css are treated as CSS-value carriers, and any quoted string containing a hyphen is treated as a class-name literal (since Ruby identifiers cannot contain hyphens)",
      "CI-friendly via rake css_unused:ci, which exits with status 1 when unused classes are detected",
      "Source-file attribution mode (report_verbose) traces each unused class back to the stylesheet where it was declared",
    ],
  }
]

projects.each do |attrs|
  project = Project.find_or_initialize_by(title: attrs[:title])
  project.update!(attrs)
end

# ══════════════════════════════════════════════
# Experience — separated by role
# ══════════════════════════════════════════════
Experience.destroy_all

experiences = [
  {
    company: "Blackstack Software Solutions",
    company_url: "https://www.linkedin.com/company/blackstack-software-solutions/posts/?feedView=all",
    location: "Lahore, Pakistan · Remote-friendly",
    roles: [
      { title: "Software Engineer", duration: "Aug 2025 — May 2026" }
    ],
    points: [
      "Managed small engineering teams on CinnaLab and Monthend/Controllr — task breakdown, code reviews, delivery coordination.",
      "Designed and implemented Stripe-facing subscription microservice (Docyt), extracting billing paths from monolith into a service with clear REST contracts and idempotent webhook reconciliation.",
      "Set up and deployed Documenso e-signature on Heroku; integrated Documenso API for agreement workflows.",
      "Integrated HubSpot CRM sync, Moodle LMS, and multiple third-party webhook systems."
    ],
    position: 1
  },
  {
    company: "Blackstack Software Solutions",
    company_url: "https://www.linkedin.com/company/blackstack-software-solutions/posts/?feedView=all",
    location: "Lahore, Pakistan · Remote-friendly",
    roles: [
      { title: "Associate Software Engineer", duration: "Jun 2024 — Aug 2025" }
    ],
    points: [
      "Developed and optimized search query performance for Intercollegiate (national athletics job board), tuning ActiveRecord and PostgreSQL indexes to achieve sub-200ms response times for 2,500+ listings.",
      "Shipped core features for Bullseye (K-12 coaching platform) across Rails APIs and React components, implementing role-aware permission flows for staff and admin views.",
      "Built secure authentication (Google OAuth 2.0, Devise) and multi-step onboarding forms using Hotwire, Stimulus.js, and Turbo for Monthend/Controllr.",
      "Collaborated closely in agile sprints, participating in code reviews, API contract design, and CI/CD maintenance."
    ],
    position: 2
  },
  {
    company: "Al-Khawarizmi Institute of Computer Science (KICS), UET Lahore",
    company_url: "https://www.linkedin.com/company/kics/posts/?feedView=all",
    location: "Lahore, Pakistan",
    roles: [
      { title: "Research & Development Intern", duration: "Jul 2023 — Oct 2023" }
    ],
    points: [
      "Optimized legacy research code paths and prototyped ideas on short research cycles.",
      "Worked with faculty-led teams to turn requirements into runnable experiments."
    ],
    position: 3
  },
  {
    company: "Apex Space",
    company_url: "https://www.linkedin.com/company/apexspace/posts/?feedView=all",
    location: "Lahore, Pakistan",
    roles: [
      { title: "Web Development Intern", duration: "Jun 2023 — Aug 2023" }
    ],
    points: [
      "Built and refined responsive client sites; improved perceived performance on key pages.",
      "Practiced agile rituals, reviews, and documentation on student-led deliveries."
    ],
    position: 4
  }
]

experiences.each do |attrs|
  Experience.create!(attrs)
end

# ══════════════════════════════════════════════
# Education
# ══════════════════════════════════════════════
educations = [
  {
    school: "University of Engineering and Technology (UET), Lahore",
    degree: "B.S. Computer Science",
    field: "Computer Science",
    duration: "2020 — 2024",
    gpa: "3.1",
    position: 1
  }
]

educations.each do |attrs|
  Education.find_or_create_by!(school: attrs[:school], degree: attrs[:degree]) do |e|
    e.assign_attributes(attrs)
  end
end

# ══════════════════════════════════════════════
# Gem Stats (seeded from rubygems.org API)
# ══════════════════════════════════════════════
now = Time.current
gem_stats = [
  { name: "rails-guarddog", version: "0.1.8", downloads: 1959, updated_at: now },
  { name: "rails-persona", version: "0.2.7", downloads: 1145, updated_at: now },
  { name: "rails-tenantify", version: "0.1.2", downloads: 450, updated_at: now },
  { name: "rails-css_unused", version: "0.2.1", downloads: 627, updated_at: now },
]

gem_stats.each do |attrs|
  GemStat.find_or_create_by!(name: attrs[:name]) do |gs|
    gs.assign_attributes(attrs)
  end
end

# ══════════════════════════════════════════════
# Summary
# ══════════════════════════════════════════════
puts "Seeded:"
puts "  User: #{user.email}"
puts "  Profile: #{profile.name} (#{profile.skills.size} skills)"
puts "  Projects: #{Project.count}"
puts "  Experience: #{Experience.count}"
puts "  Education: #{Education.count}"
puts "  Gem Stats: #{GemStat.count}"
puts ""
puts "Set ADMIN_PASSWORD env var to change the admin password"