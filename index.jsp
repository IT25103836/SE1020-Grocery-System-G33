<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>G33 Grocery — Premium Groceries Delivered</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        'display': ['Syne', 'sans-serif'],
                        'body': ['DM Sans', 'sans-serif'],
                    },
                    colors: {
                        dark: {
                            950: '#030712',
                            900: '#0a0f1e',
                            800: '#0d1526',
                            700: '#111c33',
                        },
                        accent: {
                            green: '#00e5a0',
                            teal: '#00c4cc',
                            lime: '#a3e635',
                        }
                    },
                    animation: {
                        'float': 'float 6s ease-in-out infinite',
                        'float-delayed': 'float 6s ease-in-out 2s infinite',
                        'shimmer': 'shimmer 2.5s linear infinite',
                        'fade-up': 'fadeUp 0.8s ease forwards',
                        'fade-up-delay': 'fadeUp 0.8s ease 0.2s forwards',
                        'fade-up-delay2': 'fadeUp 0.8s ease 0.4s forwards',
                        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                    },
                    keyframes: {
                        float: {
                            '0%, 100%': { transform: 'translateY(0px)' },
                            '50%': { transform: 'translateY(-18px)' },
                        },
                        shimmer: {
                            '0%': { backgroundPosition: '-200% center' },
                            '100%': { backgroundPosition: '200% center' },
                        },
                        fadeUp: {
                            '0%': { opacity: '0', transform: 'translateY(30px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' },
                        }
                    }
                }
            }
        }
    </script>
    <style>
        * { box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background-color: #030712;
            color: #e2e8f0;
            overflow-x: hidden;
        }

        /* ── Mesh background ── */
        .mesh-bg {
            position: fixed;
            inset: 0;
            z-index: 0;
            background:
                radial-gradient(ellipse 80% 60% at 10% 15%,  rgba(0,229,160,0.10) 0%, transparent 60%),
                radial-gradient(ellipse 70% 50% at 85% 80%,  rgba(0,196,204,0.10) 0%, transparent 55%),
                radial-gradient(ellipse 60% 40% at 50% 50%,  rgba(163,230,53,0.05) 0%, transparent 50%),
                #030712;
        }

        /* ── Glass utility ── */
        .glass {
            background: rgba(255,255,255,0.04);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.08);
        }
        .glass-strong {
            background: rgba(255,255,255,0.07);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.12);
        }
        .glass-card {
            background: rgba(13, 21, 38, 0.60);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255,255,255,0.07);
            transition: all 0.35s cubic-bezier(0.4,0,0.2,1);
        }
        .glass-card:hover {
            background: rgba(13, 21, 38, 0.80);
            border-color: rgba(0,229,160,0.25);
            transform: translateY(-6px);
            box-shadow: 0 24px 60px rgba(0,0,0,0.5), 0 0 0 1px rgba(0,229,160,0.10);
        }

        /* ── Navbar ── */
        .navbar {
            background: rgba(3, 7, 18, 0.70);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border-bottom: 1px solid rgba(255,255,255,0.07);
        }

        /* ── Gradient text ── */
        .gradient-text {
            background: linear-gradient(135deg, #00e5a0 0%, #00c4cc 50%, #a3e635 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .gradient-text-white {
            background: linear-gradient(160deg, #ffffff 0%, #94a3b8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* ── CTA button ── */
        .btn-primary {
            background: linear-gradient(135deg, #00e5a0, #00c4cc);
            color: #030712;
            font-weight: 700;
            letter-spacing: 0.02em;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .btn-primary::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, #a3e635, #00e5a0);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .btn-primary:hover::before { opacity: 1; }
        .btn-primary span { position: relative; z-index: 1; }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 12px 32px rgba(0,229,160,0.35); }

        /* ── Add to cart ── */
        .btn-cart {
            background: rgba(0,229,160,0.08);
            border: 1px solid rgba(0,229,160,0.25);
            color: #00e5a0;
            transition: all 0.28s ease;
            font-family: 'DM Sans', sans-serif;
        }
        .btn-cart:hover {
            background: linear-gradient(135deg, #00e5a0, #00c4cc);
            color: #030712;
            border-color: transparent;
            box-shadow: 0 8px 24px rgba(0,229,160,0.30);
        }

        /* ── Search ── */
        .search-input {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.09);
            backdrop-filter: blur(8px);
            color: #e2e8f0;
            transition: all 0.3s ease;
        }
        .search-input:focus {
            outline: none;
            border-color: rgba(0,229,160,0.40);
            box-shadow: 0 0 0 3px rgba(0,229,160,0.08);
            background: rgba(255,255,255,0.07);
        }
        .search-input::placeholder { color: #475569; }

        /* ── Sort select ── */
        .sort-select {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.09);
            backdrop-filter: blur(8px);
            color: #e2e8f0;
            cursor: pointer;
            transition: all 0.3s ease;
            appearance: none;
            -webkit-appearance: none;
        }
        .sort-select:focus {
            outline: none;
            border-color: rgba(0,229,160,0.40);
            box-shadow: 0 0 0 3px rgba(0,229,160,0.08);
        }
        .sort-select option { background: #0d1526; color: #e2e8f0; }

        /* ── Tag badge ── */
        .category-badge {
            background: rgba(0,229,160,0.10);
            border: 1px solid rgba(0,229,160,0.18);
            color: #00e5a0;
            font-size: 0.68rem;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }

        /* ── Price tag ── */
        .price-tag { color: #00e5a0; font-family: 'Syne', sans-serif; }

        /* ── Glow orbs ── */
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.18;
            pointer-events: none;
        }

        /* ── Product image placeholder ── */
        .product-img-wrap {
            background: linear-gradient(135deg, rgba(0,229,160,0.06), rgba(0,196,204,0.04));
            border-bottom: 1px solid rgba(255,255,255,0.06);
            overflow: hidden;
            position: relative;
        }
        .product-img-wrap::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, transparent 60%, rgba(13,21,38,0.6) 100%);
        }

        /* ── Shimmer on image ── */
        .shimmer-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg, transparent 25%, rgba(255,255,255,0.04) 50%, transparent 75%);
            background-size: 200% 100%;
            animation: shimmer 2.5s linear infinite;
        }

        /* ── Stats strip ── */
        .stat-item { border-right: 1px solid rgba(255,255,255,0.07); }
        .stat-item:last-child { border-right: none; }

        /* ── Section label ── */
        .section-eyebrow {
            letter-spacing: 0.14em;
            text-transform: uppercase;
            font-size: 0.72rem;
            color: #00e5a0;
            font-weight: 600;
        }

        /* ── Scroll fade-in ── */
        .fade-init { opacity: 0; transform: translateY(24px); transition: opacity 0.7s ease, transform 0.7s ease; }
        .fade-in   { opacity: 1; transform: translateY(0); }

        /* Stagger delays */
        .delay-1 { transition-delay: 0.1s; }
        .delay-2 { transition-delay: 0.2s; }
        .delay-3 { transition-delay: 0.3s; }
        .delay-4 { transition-delay: 0.4s; }
        .delay-5 { transition-delay: 0.5s; }
        .delay-6 { transition-delay: 0.6s; }

        /* Nav link hover */
        .nav-link {
            color: #94a3b8;
            transition: color 0.2s ease;
            font-size: 0.9rem;
        }
        .nav-link:hover { color: #00e5a0; }
    </style>
</head>
<body class="antialiased">

    <!-- ═══════════════════════════════════════
         MESH BACKGROUND
    ════════════════════════════════════════ -->
    <div class="mesh-bg"></div>

    <!-- ═══════════════════════════════════════
         NAVBAR
    ════════════════════════════════════════ -->
    <nav class="navbar fixed top-0 left-0 right-0 z-50">
        <div class="max-w-7xl mx-auto px-6 py-4 flex items-center gap-6">

            <!-- Logo -->
            <a href="#" class="flex items-center gap-2.5 flex-shrink-0 mr-4">
                <div class="w-8 h-8 rounded-lg flex items-center justify-center"
                     style="background: linear-gradient(135deg,#00e5a0,#00c4cc);">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                        <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z" stroke="#030712" stroke-width="2.2" stroke-linejoin="round"/>
                        <line x1="3" y1="6" x2="21" y2="6" stroke="#030712" stroke-width="2.2"/>
                        <path d="M16 10a4 4 0 01-8 0" stroke="#030712" stroke-width="2.2" stroke-linecap="round"/>
                    </svg>
                </div>
                <span class="font-display font-800 text-xl tracking-tight">
                    <span class="text-white">G33</span>
                    <span class="gradient-text"> Grocery</span>
                </span>
            </a>

            <!-- Search bar -->
            <div class="flex-1 max-w-md relative hidden md:block">
                <svg class="absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-500 w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
                </svg>
                <input type="text" placeholder="Search fresh produce, dairy, snacks…"
                       class="search-input w-full pl-10 pr-4 py-2.5 rounded-xl text-sm font-body"/>
            </div>

            <!-- Nav links -->
            <div class="hidden md:flex items-center gap-6 ml-auto">
                <a href="#" class="nav-link font-body">Products</a>
                <a href="#" class="nav-link font-body">Offers</a>
                <a href="#" class="nav-link font-body">About</a>
            </div>

            <!-- Auth buttons -->
            <div class="flex items-center gap-3 ml-4 flex-shrink-0">
                <a href="login.jsp"
                   class="nav-link font-body font-medium px-4 py-2 rounded-xl glass hover:border-slate-600 transition-all text-sm border border-transparent hidden sm:block">
                    Login
                </a>
                <a href="register.jsp"
                   class="btn-primary px-4 py-2 rounded-xl text-sm font-display font-700">
                    <span>Register</span>
                </a>
            </div>
        </div>
    </nav>

    <!-- ═══════════════════════════════════════
         HERO SECTION
    ════════════════════════════════════════ -->
    <section class="relative pt-32 pb-20 px-6 overflow-hidden" style="z-index:1;">

        <!-- Decorative orbs -->
        <div class="orb w-96 h-96 top-0 left-0" style="background:#00e5a0;"></div>
        <div class="orb w-80 h-80 top-10 right-10 animate-float-delayed" style="background:#00c4cc; animation-delay:1.5s;"></div>
        <div class="orb w-64 h-64 bottom-0 left-1/2" style="background:#a3e635;"></div>

        <div class="max-w-7xl mx-auto">
            <div class="max-w-3xl">
                <!-- Eyebrow -->
                <div class="inline-flex items-center gap-2 glass rounded-full px-4 py-1.5 mb-6 animate-fade-up" style="opacity:0;">
                    <span class="w-1.5 h-1.5 rounded-full bg-accent-green animate-pulse-slow"></span>
                    <span class="section-eyebrow">Now available in Colombo · Fast delivery</span>
                </div>

                <!-- Headline -->
                <h1 class="font-display text-5xl md:text-6xl lg:text-7xl font-800 leading-none mb-6 animate-fade-up-delay" style="opacity:0;">
                    <span class="gradient-text-white block">Premium Groceries</span>
                    <span class="gradient-text block mt-1">Delivered to Your</span>
                    <span class="gradient-text-white block mt-1">Doorstep.</span>
                </h1>

                <!-- Sub -->
                <p class="text-slate-400 text-lg md:text-xl font-body font-300 leading-relaxed max-w-xl mb-10 animate-fade-up-delay2" style="opacity:0;">
                    Curated, fresh, and ethically sourced groceries — delivered same day.
                    Experience the future of grocery shopping.
                </p>

                <!-- CTAs -->
                <div class="flex flex-wrap gap-4 animate-fade-up-delay2" style="opacity:0;">
                    <a href="#products" class="btn-primary px-7 py-3.5 rounded-xl text-base font-display font-700 flex items-center gap-2">
                        <span>Shop Now</span>
                        <svg class="w-4 h-4 relative z-10" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                    <a href="#" class="glass-strong px-7 py-3.5 rounded-xl text-base font-display font-600 text-slate-200 hover:text-white hover:border-slate-500 transition-all flex items-center gap-2">
                        View Offers
                        <span class="text-xs px-2 py-0.5 rounded-full" style="background:rgba(0,229,160,0.15);color:#00e5a0;">20% off</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Stats strip -->
        <div class="max-w-7xl mx-auto mt-20">
            <div class="glass rounded-2xl grid grid-cols-2 md:grid-cols-4">
                <div class="stat-item px-6 py-5">
                    <p class="font-display text-2xl font-700 gradient-text">2,400+</p>
                    <p class="text-slate-500 text-sm font-body mt-0.5">Products Available</p>
                </div>
                <div class="stat-item px-6 py-5">
                    <p class="font-display text-2xl font-700 gradient-text">98%</p>
                    <p class="text-slate-500 text-sm font-body mt-0.5">On-Time Delivery</p>
                </div>
                <div class="stat-item px-6 py-5">
                    <p class="font-display text-2xl font-700 gradient-text">50K+</p>
                    <p class="text-slate-500 text-sm font-body mt-0.5">Happy Customers</p>
                </div>
                <div class="px-6 py-5">
                    <p class="font-display text-2xl font-700 gradient-text">2hr</p>
                    <p class="text-slate-500 text-sm font-body mt-0.5">Express Delivery</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ═══════════════════════════════════════
         PRODUCTS SECTION
    ════════════════════════════════════════ -->
    <section id="products" class="relative py-16 px-6" style="z-index:1;">
        <div class="max-w-7xl mx-auto">

            <!-- Section header + sort -->
            <div class="flex flex-col sm:flex-row sm:items-end justify-between gap-4 mb-10 fade-init" id="section-header">
                <div>
                    <p class="section-eyebrow mb-2">Our Selection</p>
                    <h2 class="font-display text-3xl md:text-4xl font-700">
                        <span class="gradient-text-white">Fresh Picks</span>
                        <span class="gradient-text"> This Week</span>
                    </h2>
                </div>

                <!-- Sort Component — will connect to Merge Sort backend -->
                <div class="relative flex-shrink-0">
                    <label class="block text-xs font-body text-slate-500 mb-1.5 uppercase tracking-widest">Sort by Price</label>
                    <div class="relative">
                        <select name="sortOrder" id="sortOrder"
                                class="sort-select pl-4 pr-10 py-2.5 rounded-xl text-sm font-body min-w-[200px]"
                                onchange="sortProducts(this.value)">
                            <option value="default">Default Order</option>
                            <option value="asc">Price: Low → High</option>
                            <option value="desc">Price: High → Low</option>
                        </select>
                        <!-- Custom arrow -->
                        <div class="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 text-slate-400">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <path d="M6 9l6 6 6-6"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-xs text-slate-600 mt-1 font-body">Powered by Merge Sort algorithm</p>
                </div>
            </div>

            <!-- Product Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6" id="product-grid">

                <%-- ═══ PRODUCT CARD 1 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-1 product-card" data-price="1290">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1542838132-92c53300491e?w=400&h=300&fit=crop&auto=format"
                             alt="Organic Vegetables"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Vegetables</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Organic Veggie Bundle</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Locally sourced · 1.5 kg pack</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <p class="price-tag text-2xl font-700">LKR 1,290</p>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <%-- ═══ PRODUCT CARD 2 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-2 product-card" data-price="2450">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?w=400&h=300&fit=crop&auto=format"
                             alt="Tropical Fruits"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Fruits</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Tropical Fruit Basket</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Mango, Papaya, Pineapple · 2 kg</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <p class="price-tag text-2xl font-700">LKR 2,450</p>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <%-- ═══ PRODUCT CARD 3 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-3 product-card" data-price="890">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=300&fit=crop&auto=format"
                             alt="Farm Fresh Dairy"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Dairy</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Farm Fresh Full-Cream Milk</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Pasteurized · 1 litre pack</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <p class="price-tag text-2xl font-700">LKR 890</p>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <%-- ═══ PRODUCT CARD 4 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-4 product-card" data-price="3750">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1574966739987-65a4208a9248?w=400&h=300&fit=crop&auto=format"
                             alt="Premium Seafood"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Seafood</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Premium Tiger Prawns</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Wild-caught · Cleaned · 500 g</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <p class="price-tag text-2xl font-700">LKR 3,750</p>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <%-- ═══ PRODUCT CARD 5 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-5 product-card" data-price="1640">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop&auto=format"
                             alt="Artisan Breads"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Bakery</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Artisan Sourdough Loaf</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Stone-baked · Whole grain · 800 g</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <p class="price-tag text-2xl font-700">LKR 1,640</p>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <%-- ═══ PRODUCT CARD 6 ═══ --%>
                <div class="glass-card rounded-2xl overflow-hidden fade-init delay-6 product-card" data-price="5200">
                    <div class="product-img-wrap h-52 flex items-center justify-center relative">
                        <!-- Bestseller badge -->
                        <div class="absolute top-3 right-3 z-10 text-xs font-display font-700 px-2.5 py-1 rounded-full"
                             style="background:linear-gradient(135deg,#00e5a0,#00c4cc);color:#030712;letter-spacing:0.04em;">
                            BESTSELLER
                        </div>
                        <div class="shimmer-overlay"></div>
                        <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop&auto=format"
                             alt="Gourmet Bundle"
                             class="w-full h-full object-cover opacity-80 hover:opacity-100 hover:scale-105 transition-all duration-500"/>
                    </div>
                    <div class="p-5">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <span class="category-badge px-2.5 py-1 rounded-full font-body">Gourmet</span>
                                <h3 class="font-display font-600 text-white text-lg mt-2 leading-tight">Premium Gourmet Bundle</h3>
                                <p class="text-slate-500 text-sm font-body mt-1">Chef-selected · 12 items · 3 kg</p>
                            </div>
                        </div>
                        <div class="flex items-center justify-between mt-4 pt-4 border-t border-white/5">
                            <div>
                                <p class="price-tag text-2xl font-700">LKR 5,200</p>
                                <p class="text-xs text-slate-600 font-body line-through">LKR 6,800</p>
                            </div>
                            <button class="btn-cart px-4 py-2 rounded-xl text-sm font-display font-600 flex items-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4zM3 6h18M16 10a4 4 0 01-8 0"/>
                                </svg>
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

            </div><!-- /product-grid -->
        </div>
    </section>

    <!-- ═══════════════════════════════════════
         FOOTER
    ════════════════════════════════════════ -->
    <footer class="relative py-10 px-6 border-t border-white/5 mt-10" style="z-index:1;">
        <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
            <div class="flex items-center gap-2">
                <span class="font-display font-700 text-lg">
                    <span class="text-white">G33</span>
                    <span class="gradient-text"> Grocery</span>
                </span>
                <span class="text-slate-600 text-sm font-body">© 2025. All rights reserved.</span>
            </div>
            <div class="flex items-center gap-6">
                <a href="#" class="nav-link text-sm">Privacy</a>
                <a href="#" class="nav-link text-sm">Terms</a>
                <a href="#" class="nav-link text-sm">Contact</a>
            </div>
        </div>
    </footer>

    <!-- ═══════════════════════════════════════
         JAVASCRIPT
    ════════════════════════════════════════ -->
    <script>
        // ── Scroll-triggered fade-in ──────────────────────────────────
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(e => {
                if (e.isIntersecting) {
                    e.target.classList.add('fade-in');
                    observer.unobserve(e.target);
                }
            });
        }, { threshold: 0.12 });

        document.querySelectorAll('.fade-init').forEach(el => observer.observe(el));

        // ── Hero animation (CSS-driven, trigger via JS) ───────────────
        document.querySelectorAll('.animate-fade-up, .animate-fade-up-delay, .animate-fade-up-delay2')
            .forEach(el => {
                el.style.opacity = '0';
                requestAnimationFrame(() => {
                    el.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
                    el.style.transform = 'translateY(30px)';
                    setTimeout(() => {
                        el.style.opacity = '1';
                        el.style.transform = 'translateY(0)';
                    }, el.classList.contains('animate-fade-up') ? 100 :
                       el.classList.contains('animate-fade-up-delay') ? 300 : 500);
                });
            });

        // ── Client-side Sort (UI-only; replace with form submit for backend Merge Sort) ──
        function sortProducts(order) {
            const grid  = document.getElementById('product-grid');
            const cards = Array.from(grid.querySelectorAll('.product-card'));

            if (order === 'default') {
                // restore DOM order by original position
                cards.sort((a, b) => Array.from(grid.children).indexOf(a) - Array.from(grid.children).indexOf(b));
            } else {
                cards.sort((a, b) => {
                    const pa = parseInt(a.dataset.price);
                    const pb = parseInt(b.dataset.price);
                    return order === 'asc' ? pa - pb : pb - pa;
                });
            }

            // Animate re-insertion
            cards.forEach((card, i) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(16px)';
                grid.appendChild(card);
                setTimeout(() => {
                    card.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, i * 60);
            });
        }

        // ── Cart button click feedback ────────────────────────────────
        document.querySelectorAll('.btn-cart').forEach(btn => {
            btn.addEventListener('click', function () {
                const original = this.innerHTML;
                this.innerHTML = `<svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path d="M20 6L9 17l-5-5"/>
                </svg> Added!`;
                this.style.background = 'linear-gradient(135deg,#00e5a0,#00c4cc)';
                this.style.color = '#030712';
                setTimeout(() => {
                    this.innerHTML = original;
                    this.style.background = '';
                    this.style.color = '';
                }, 1800);
            });
        });
    </script>
</body>
</html>
