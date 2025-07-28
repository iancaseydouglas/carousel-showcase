// Accessibility enhancements for all carousels
document.addEventListener('DOMContentLoaded', function() {
    // Add ARIA live regions for carousel announcements
    const carousels = document.querySelectorAll('[id*="carousel"], [id*="Carousel"]');
    
    carousels.forEach(carousel => {
        // Add live region for screen reader announcements
        const liveRegion = document.createElement('div');
        liveRegion.setAttribute('aria-live', 'polite');
        liveRegion.setAttribute('aria-atomic', 'false');
        liveRegion.setAttribute('class', 'sr-only');
        liveRegion.id = carousel.id + '-live-region';
        carousel.parentNode.appendChild(liveRegion);
        
        // Add carousel role and label
        carousel.setAttribute('role', 'region');
        carousel.setAttribute('aria-label', 'Interactive carousel');
        
        // Add reduced motion detection
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
            carousel.classList.add('reduced-motion');
            // Disable auto-rotation for reduced motion users
            const event = new CustomEvent('disable-auto-rotation');
            carousel.dispatchEvent(event);
        }
    });
    
    // Global keyboard navigation handler
    document.addEventListener('keydown', function(e) {
        // ESC key pauses all carousels
        if (e.key === 'Escape') {
            const playButtons = document.querySelectorAll('[id*="PlayPause"]');
            playButtons.forEach(btn => {
                if (btn.textContent.includes('Pause')) {
                    btn.click();
                }
            });
        }
    });
    
    // Announce slide changes to screen readers
    function announceSlideChange(carousel, slideNumber, totalSlides, slideTitle) {
        const liveRegion = document.getElementById(carousel.id + '-live-region');
        if (liveRegion) {
            liveRegion.textContent = `Slide ${slideNumber} of ${totalSlides}: ${slideTitle}`;
        }
    }
    
    // Export function for carousel instances to use
    window.announceSlideChange = announceSlideChange;
});