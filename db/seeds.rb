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
    description: "SaaS platform for month-end close and financial controls, built at Blackstack. Built authentication (email + Google OAuth 2.0), multi-step onboarding flows, and workflow management surfaces for finance teams using Devise and React. Managed small engineering team on this project.",
    url: "https://fly.controllr.app/",
    github_url: "https://fly.controllr.app/",
    tech_stack: ["Ruby on Rails", "React.js", "OAuth", "PostgreSQL", "Devise"],
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
      "Multi-step React onboarding with shared form state patterns",
      "REST collaboration on control and checklist endpoints",
    ],
  },
  {
    title: "Online Exam System",
    description: "Capstone-style Rails app: exam authoring, approvals, student attempts, grading, and reporting (PostgreSQL).",
    url: "https://github.com/sghani001/Online_Exam_System",
    github_url: "https://github.com/sghani001/Online_Exam_System",
    tech_stack: ["Rails", "PostgreSQL", "RSpec"],
    images: ["https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=600&h=380&fit=crop"],
    featured: false,
    position: 6
  },
  {
    title: "rails-guarddog",
    description: "Production-grade security scanner for Rails apps. Detects vulnerabilities Brakeman misses: AI/LLM injection, DoS/ReDoS patterns, supply chain typosquatting, IDOR gaps, and more. 12 comprehensive security checkers with CWE/OWASP mappings.",
    url: "https://github.com/sghani001/rails-guarddog",
    github_url: "https://github.com/sghani001/rails-guarddog",
    tech_stack: ["Ruby", "Security", "AST Analysis", "Brakeman", "CWE", "OWASP"],
    images: ["https://images.unsplash.com/photo-1581092334490-2f9c7e8e1e9c?w=600&h=380&fit=crop"],
    featured: true,
    position: 7
  },
  {
    title: "rails-persona",
    description: "Model-level behavioral analytics engine for Rails. Tracks user actions, analyzes onboarding friction, and handles heavy payloads using bulk database inserts and Sidekiq background jobs natively with zero external dependencies.",
    url: "https://github.com/sghani001/rails-persona",
    github_url: "https://github.com/sghani001/rails-persona",
    tech_stack: ["Ruby", "Rails Engine", "Sidekiq", "Analytics"],
    images: ["https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=600&h=380&fit=crop"],
    featured: true,
    position: 8
  },
  {
    title: "rails-tenantify",
    description: "Lightweight multi-tenancy infrastructure for SaaS applications. Automates sub-domain/request-based routing, secure database isolation scoping, and streamlined tenant onboarding workflows without the bloat of heavy legacy packages.",
    url: "https://github.com/sghani001/rails-tenantify",
    github_url: "https://github.com/sghani001/rails-tenantify",
    tech_stack: ["Ruby on Rails", "SaaS Architecture", "Multi-tenancy"],
    images: ["https://images.unsplash.com/photo-1508830524289-0adcbe822b40?w=600&h=380&fit=crop"],
    featured: true,
    position: 9
  },
  {
    title: "rails-css_unused",
    description: "Performance-focused static analysis tool. Scans views, templates, and view components to locate and strip dead, unused CSS classes blocking your asset pipeline payload — ideal for refactoring large legacy codebases.",
    url: "https://github.com/sghani001/rails-css_unused",
    github_url: "https://github.com/sghani001/rails-css_unused",
    tech_stack: ["Ruby", "Static Analysis", "Asset Pipeline"],
    images: ["https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&h=380&fit=crop"],
    featured: true,
    position: 10
  }
]

projects.each do |attrs|
  project = Project.find_or_initialize_by(title: attrs[:title])
  project.update!(attrs)
end

# ══════════════════════════════════════════════
# Experience — grouped by company with roles array
# ══════════════════════════════════════════════
experiences = [
  {
    company: "Blackstack Software Solutions",
    company_url: "https://www.linkedin.com/company/blackstack-software-solutions/posts/?feedView=all",
    location: "Lahore, Pakistan · Remote-friendly",
    roles: [
      { title: "Software Engineer", duration: "Aug 2025 — May 2026" },
      { title: "Associate Software Engineer", duration: "Aug 2024 — Aug 2025" },
    ],
    points: [
      "Managed small engineering teams on CinnaLab and Monthend/Controllr — task breakdown, code reviews, delivery coordination.",
      "Set up and deployed Documenso e-signature on Heroku; integrated Documenso API for agreement workflows.",
      "Set up and integrated Moodle LMS with two-way sync; managed Moodle deployment and API integration for training paths.",
      "Integrated Stripe payment processing, HubSpot CRM sync, and multiple third-party webhook systems.",
    ],
    position: 1
  },
  {
    company: "Al-Khawarizmi Institute of Computer Science (KICS), UET Lahore",
    company_url: "https://www.linkedin.com/company/kics/posts/?feedView=all",
    location: "Lahore, Pakistan",
    roles: [
      { title: "Research & Development Intern", duration: "Jul 2023 — Oct 2023" },
    ],
    points: [
      "Optimized legacy research code paths and prototyped ideas on short research cycles.",
      "Worked with faculty-led teams to turn requirements into runnable experiments.",
    ],
    position: 2
  },
  {
    company: "Apex Space",
    company_url: "https://www.linkedin.com/company/apexspace/posts/?feedView=all",
    location: "Lahore, Pakistan",
    roles: [
      { title: "Web Development Intern", duration: "Jun 2023 — Aug 2023" },
    ],
    points: [
      "Built and refined responsive client sites; improved perceived performance on key pages.",
      "Practiced agile rituals, reviews, and documentation on student-led deliveries.",
    ],
    position: 3
  }
]

experiences.each do |attrs|
  exp = Experience.find_or_initialize_by(company: attrs[:company])
  exp.update!(attrs)
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
