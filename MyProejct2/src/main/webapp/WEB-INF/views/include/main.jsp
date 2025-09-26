<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<title>나만의 스터디 플래너 - 메인</title>

<style>
    /* 메인 페이지 전용 스타일 */
    .hero-section {
        background: var(--primary-gradient);
        color: white;
        padding: 120px 0 80px;
        position: relative;
        overflow: hidden;
        margin-top: 76px; /* 네비게이션 높이만큼 여백 */
    }
    
    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.05)"/><circle cx="50" cy="10" r="1" fill="rgba(255,255,255,0.08)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>') repeat;
        opacity: 0.3;
    }
    
    .hero-content {
        position: relative;
        z-index: 2;
    }
    
    .feature-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border: none;
        border-radius: 20px;
        padding: 2.5rem 2rem;
        height: 100%;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        position: relative;
        overflow: hidden;
    }
    
    .feature-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: var(--primary-gradient);
        transform: scaleX(0);
        transition: transform 0.3s ease;
    }
    
    .feature-card:hover {
        transform: translateY(-15px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }
    
    .feature-card:hover::before {
        transform: scaleX(1);
    }
    
    .feature-icon {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2.5rem;
        margin: 0 auto 1.5rem;
        transition: all 0.3s ease;
    }
    
    .icon-study {
        background: var(--primary-gradient);
        color: white;
    }
    
    .icon-calendar {
        background: var(--secondary-gradient);
        color: white;
    }
    
    .icon-stats {
        background: var(--success-gradient);
        color: white;
    }
    
    .feature-card:hover .feature-icon {
        transform: scale(1.1) rotate(5deg);
    }
    
    .stats-section {
        padding: 80px 0;
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(10px);
    }
    
    .stat-card {
        text-align: center;
        padding: 2.5rem 2rem;
        border-radius: 20px;
        background: white;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        transition: all 0.3s ease;
        border: 2px solid transparent;
    }
    
    .stat-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        border-color: rgba(102, 126, 234, 0.3);
    }
    
    .stat-number {
        font-size: 3.5rem;
        font-weight: 700;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 0.5rem;
    }
    
    .stat-label {
        color: #6c757d;
        font-weight: 500;
        font-size: 1.1rem;
    }
    
    .cta-section {
        background: var(--secondary-gradient);
        color: white;
        padding: 80px 0;
        text-align: center;
        position: relative;
    }
    
    .cta-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>') repeat;
        opacity: 0.4;
    }
    
    .btn-custom {
        background: white;
        color: #667eea;
        border: none;
        padding: 15px 40px;
        border-radius: 50px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        position: relative;
        overflow: hidden;
    }
    
    .btn-custom::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
        transition: left 0.5s;
    }
    
    .btn-custom:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        color: #667eea;
    }
    
    .btn-custom:hover::before {
        left: 100%;
    }
    
    .pulse {
        animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
        0% { box-shadow: 0 5px 15px rgba(0,0,0,0.2), 0 0 0 0 rgba(102, 126, 234, 0.7); }
        70% { box-shadow: 0 5px 15px rgba(0,0,0,0.2), 0 0 0 10px rgba(102, 126, 234, 0); }
        100% { box-shadow: 0 5px 15px rgba(0,0,0,0.2), 0 0 0 0 rgba(102, 126, 234, 0); }
    }
    
    .floating {
        animation: floating 3s ease-in-out infinite;
    }
    
    @keyframes floating {
        0%, 100% { transform: translate(0px, 0px) rotate(0deg); }
        33% { transform: translate(30px, -30px) rotate(5deg); }
        66% { transform: translate(-20px, 20px) rotate(-5deg); }
    }
    
    .quick-action-card {
        background: white;
        border-radius: 15px;
        padding: 1.5rem;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        border: 2px solid transparent;
    }
    
    .quick-action-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        border-color: #667eea;
    }
    
    .quick-actions-section {
        padding: 60px 0;
        background: linear-gradient(135deg, #f8f9ff 0%, #e8f2ff 100%);
    }
    
    .section-title {
        position: relative;
        display: inline-block;
        margin-bottom: 3rem;
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 3px;
        background: var(--primary-gradient);
        border-radius: 2px;
    }
    
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 0 60px;
        }
        
        .feature-card, .stat-card {
            margin-bottom: 2rem;
        }
        
        .stat-number {
            font-size: 2.5rem;
        }
        
        .btn-custom {
            padding: 12px 30px;
            font-size: 0.9rem;
        }
    }
</style>

<!-- Hero Section -->
<section id="home" class="hero-section">
    <div class="container hero-content">
        <div class="row align-items-center">
            <div class="col-lg-6" data-aos="fade-right" data-aos-duration="1000">
                <h1 class="display-4 fw-bold mb-4">
                    스터디를 <span class="text-warning">체계적으로</span><br>
                    관리하세요!
                </h1>
                <p class="lead mb-4">
                    오늘의 계획, 목표, 일정까지 한눈에 확인하고<br>
                    효율적인 학습 경험을 만들어보세요.
                </p>
                <div class="d-flex gap-3 flex-wrap">
                    <button class="btn btn-custom btn-lg pulse" onclick="scrollToFeatures()">
                        <i class="bi bi-rocket-takeoff me-2"></i>시작하기
                    </button>
                    <button class="btn btn-outline-light btn-lg">
                        <i class="bi bi-play-circle me-2"></i>데모 보기
                    </button>
                </div>
            </div>
            <div class="col-lg-6" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="200">
                <div class="text-center">
                    <div class="floating">
                        <i class="bi bi-calendar-check display-1 text-warning opacity-75 mb-3"></i>
                    </div>
                    <div class="row g-2 mt-4">
                        <div class="col-4">
                            <div class="floating" style="animation-delay: -1s;">
                                <i class="bi bi-book text-info" style="font-size: 2rem;"></i>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="floating" style="animation-delay: -2s;">
                                <i class="bi bi-people text-success" style="font-size: 2rem;"></i>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="floating" style="animation-delay: -0.5s;">
                                <i class="bi bi-graph-up text-danger" style="font-size: 2rem;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Quick Actions Section -->
<section class="quick-actions-section">
    <div class="container">
        <div class="text-center mb-5" data-aos="fade-up">
            <h2 class="section-title fw-bold">빠른 실행</h2>
            <p class="lead text-muted">자주 사용하는 기능들을 바로 실행해보세요</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
                <div class="quick-action-card text-center">
                    <div class="mb-3">
                        <i class="bi bi-plus-circle text-primary" style="font-size: 2.5rem;"></i>
                    </div>
                    <h5 class="fw-bold mb-2">새 스터디 만들기</h5>
                    <p class="text-muted small mb-3">개인 또는 그룹 스터디를 생성하세요</p>
                    <button class="btn btn-primary btn-sm">만들기</button>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
                <div class="quick-action-card text-center">
                    <div class="mb-3">
                        <i class="bi bi-calendar-plus text-success" style="font-size: 2.5rem;"></i>
                    </div>
                    <h5 class="fw-bold mb-2">일정 추가</h5>
                    <p class="text-muted small mb-3">새로운 학습 일정을 등록하세요</p>
                    <button class="btn btn-success btn-sm">추가하기</button>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
                <div class="quick-action-card text-center">
                    <div class="mb-3">
                        <i class="bi bi-target text-warning" style="font-size: 2.5rem;"></i>
                    </div>
                    <h5 class="fw-bold mb-2">목표 설정</h5>
                    <p class="text-muted small mb-3">학습 목표와 계획을 세워보세요</p>
                    <button class="btn btn-warning btn-sm">설정하기</button>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
                <div class="quick-action-card text-center">
                    <div class="mb-3">
                        <i class="bi bi-search text-info" style="font-size: 2.5rem;"></i>
                    </div>
                    <h5 class="fw-bold mb-2">스터디 찾기</h5>
                    <p class="text-muted small mb-3">관심 있는 스터디 그룹을 찾아보세요</p>
                    <button class="btn btn-info btn-sm">검색하기</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section id="features" class="py-5">
    <div class="container">
        <div class="text-center mb-5" data-aos="fade-up">
            <h2 class="section-title fw-bold text-dark">주요 기능</h2>
            <p class="lead text-muted">스터디 플래너의 핵심 기능들을 확인해보세요</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                <div class="feature-card text-center">
                    <div class="feature-icon icon-study">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <h3 class="h4 fw-bold mb-3">내 스터디</h3>
                    <p class="text-muted mb-4">
                        참여 중인 스터디와 진행 상황을 관리할 수 있어요. 
                        팀원들과의 협업도 더욱 효율적으로 진행하세요.
                    </p>
                    <ul class="list-unstyled text-start text-muted small">
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>진행 상황 추적</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>팀원 관리</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>과제 할당</li>
                    </ul>
                    <button class="btn btn-outline-primary mt-3">더 알아보기</button>
                </div>
            </div>
            
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                <div class="feature-card text-center">
                    <div class="feature-icon icon-calendar">
                        <i class="bi bi-calendar3"></i>
                    </div>
                    <h3 class="h4 fw-bold mb-3">일정 관리</h3>
                    <p class="text-muted mb-4">
                        스터디 일정, 과제 마감일 등을 한눈에 확인하세요. 
                        중요한 일정을 놓치지 않도록 스마트 알림까지 제공합니다.
                    </p>
                    <ul class="list-unstyled text-start text-muted small">
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>캘린더 뷰</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>알림 설정</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>반복 일정</li>
                    </ul>
                    <button class="btn btn-outline-primary mt-3">더 알아보기</button>
                </div>
            </div>
            
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
                <div class="feature-card text-center">
                    <div class="feature-icon icon-stats">
                        <i class="bi bi-graph-up"></i>
                    </div>
                    <h3 class="h4 fw-bold mb-3">통계 & 목표</h3>
                    <p class="text-muted mb-4">
                        스터디 참여 시간, 달성률 등을 분석하고 
                        개인 맞춤 목표를 설정해 성장을 확인해보세요.
                    </p>
                    <ul class="list-unstyled text-start text-muted small">
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>학습 통계</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>성취도 분석</li>
                        <li class="mb-2"><i class="bi bi-check-circle text-success me-2"></i>목표 추적</li>
                    </ul>
                    <button class="btn btn-outline-primary mt-3">더 알아보기</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="stats-section" data-aos="fade-up">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title fw-bold text-dark">실시간 통계</h2>
            <p class="lead text-muted">지금까지의 학습 성과를 확인해보세요</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
                <div class="stat-card">
                    <div class="stat-number" data-target="24">0</div>
                    <p class="stat-label mb-2">완료된 스터디</p>
                    <small class="text-success">
                        <i class="bi bi-arrow-up me-1"></i>+12% 이번 달
                    </small>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
                <div class="stat-card">
                    <div class="stat-number" data-target="156">0</div>
                    <p class="stat-label mb-2">총 학습 시간</p>
                    <small class="text-info">
                        <i class="bi bi-clock me-1"></i>이번 주 +8시간
                    </small>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
                <div class="stat-card">
                    <div class="stat-number" data-target="89">0</div>
                    <p class="stat-label mb-2">목표 달성률 (%)</p>
                    <small class="text-warning">
                        <i class="bi bi-trophy me-1"></i>평균 이상 달성
                    </small>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
                <div class="stat-card">
                    <div class="stat-number" data-target="12">0</div>
                    <p class="stat-label mb-2">참여 스터디 그룹</p>
                    <small class="text-primary">
                        <i class="bi bi-people me-1"></i>활발한 참여 중
                    </small>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section" data-aos="fade-up">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="display-5 fw-bold mb-4">지금 바로 시작해보세요!</h2>
                <p class="lead mb-5">
                    체계적인 스터디 관리로 더 나은 학습 성과를 경험해보세요.<br>
                    수천 명의 학습자들이 이미 경험하고 있습니다.
                </p>
                <div class="d-flex gap-3 justify-content-center flex-wrap">
                    <button class="btn btn-custom btn-lg">
                        <i class="bi bi-plus-circle me-2"></i>새 스터디 만들기
                    </button>
                    <button class="btn btn-outline-light btn-lg">
                        <i class="bi bi-play-circle me-2"></i>데모 보기
                    </button>
                </div>
                
                <div class="mt-5 pt-4">
                    <p class="small mb-3">함께하는 파트너들</p>
                    <div class="d-flex justify-content-center align-items-center gap-4 flex-wrap opacity-75">
                        <img src="https://via.placeholder.com/120x40/ffffff/666666?text=Partner1" alt="Partner 1" class="img-fluid">
                        <img src="https://via.placeholder.com/120x40/ffffff/666666?text=Partner2" alt="Partner 2" class="img-fluid">
                        <img src="https://via.placeholder.com/120x40/ffffff/666666?text=Partner3" alt="Partner 3" class="img-fluid">
                        <img src="https://via.placeholder.com/120x40/ffffff/666666?text=Partner4" alt="Partner 4" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // 스크롤 시 기능 섹션으로 이동
    function scrollToFeatures() {
        document.getElementById('features').scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }

    // 숫자 카운터 애니메이션
    function animateCounter(element, target, duration = 2000) {
        const start = 0;
        const increment = target / (duration / 16);
        let current = start;
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                element.textContent = target;
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(current);
            }
        }, 16);
    }

    // Intersection Observer로 통계 섹션이 보일 때 카운터 시작
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const statNumbers = entry.target.querySelectorAll('.stat-number');
                statNumbers.forEach(statNumber => {
                    const target = parseInt(statNumber.getAttribute('data-target'));
                    animateCounter(statNumber, target);
                });
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // 통계 섹션 관찰 시작
    document.addEventListener('DOMContentLoaded', function() {
        const statsSection = document.querySelector('.stats-section');
        if (statsSection) {
            observer.observe(statsSection);
        }
    });

    // 빠른 실행 버튼 이벤트
    document.addEventListener('DOMContentLoaded', function() {
        // 새 스터디 만들기
        document.querySelector('.quick-action-card .btn-primary').addEventListener('click', function() {
            alert('새 스터디 만들기 페이지로 이동합니다!');
            // window.location.href = 'create-study.jsp';
        });

        // 일정 추가
        document.querySelector('.quick-action-card .btn-success').addEventListener('click', function() {
            alert('일정 추가 페이지로 이동합니다!');
            // window.location.href = 'add-schedule.jsp';
        });

        // 목표 설정
        document.querySelector('.quick-action-card .btn-warning').addEventListener('click', function() {
            alert('목표 설정 페이지로 이동합니다!');
            // window.location.href = 'set-goals.jsp';
        });

        // 스터디 찾기
        document.querySelector('.quick-action-card .btn-info').addEventListener('click', function() {
            alert('스터디 검색 페이지로 이동합니다!');
            // window.location.href = 'search-study.jsp';
        });
    });
</script>

