<script>
    // 1. Configuración inicial (escena, cámara, renderizador, cubo)
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    const renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    // 2. Cubo (nuestro "jugador")
    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
    const cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    // 3. Cámara
    camera.position.z = 5;

    // 4. Variables para movimiento
    let moveForward = false;
    let moveBackward = false;
    let rotateLeft = false;
    let rotateRight = false;

    // 5. Detectar teclas presionadas
    window.addEventListener('keydown', (event) => {
        if (event.key === 'w') moveForward = true;
        if (event.key === 's') moveBackward = true;
        if (event.key === 'a') rotateLeft = true;
        if (event.key === 'd') rotateRight = true;
        if (event.key === ' ') shoot();
    });

    window.addEventListener('keyup', (event) => {
        if (event.key === 'w') moveForward = false;
        if (event.key === 's') moveBackward = false;
        if (event.key === 'a') rotateLeft = false;
        if (event.key === 'd') rotateRight = false;
    });

    // 6. Función para disparar
    function shoot() {
        const ray = new THREE.Raycaster(camera.position, camera.getWorldDirection(new THREE.Vector3()));
        const intersects = ray.intersectObject(cube); // Detecta si el disparo toca el cubo
        if (intersects.length > 0) {
            alert('¡Disparo exitoso!');
        }
    }

    // 7. Animar el cubo y mover la cámara
    function animate() {
        requestAnimationFrame(animate);

        // Movimiento
        if (moveForward) cube.position.z -= 0.1;
        if (moveBackward) cube.position.z += 0.1;

        // Rotación
        if (rotateLeft) cube.rotation.y += 0.05;
        if (rotateRight) cube.rotation.y -= 0.05;

        // Renderizar la escena
        renderer.render(scene, camera);
    }

    animate();
</script>
