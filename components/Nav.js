export default function Nav() {
    return (
        <nav className="flex justify-between">
            <h1 className="text-4xl font-bold">Cave.</h1>
            <div className="flex items-center space-x-3"> 
                <ul className="flex space-x-3">
                    <li>Check In</li>
                    <li>Login</li>
                </ul>
                <button className="bg-black text-white rounded-2xl p-3">Sign Up</button>
            </div>
        </nav>
    )
}
